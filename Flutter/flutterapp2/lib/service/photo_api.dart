import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutterapp2/classes/credentials.dart';
import 'package:flutterapp2/classes/photo.dart';
import 'package:universal_io/io.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  static String _baseUrl = 'http://10.0.2.2:5135/api';
  HttpClient httpClient = HttpClient();
  final FlutterSecureStorage _flutterSecureStorage =
      const FlutterSecureStorage();


  ApiService() {
    if (kIsWeb) {
      _baseUrl = 'http://127.0.0.1:5135/api';
    }
    else {
      _baseUrl = 'http://10.0.2.2:5135/api';
    }
  }
  
  // Fetches a list of images (as base64 strings) from the API
  Future<List<String>> getAllImages() async {
    List<String> result = [];
    try {
        HttpClientRequest request =
            await httpClient.getUrl(Uri.parse('$_baseUrl/image/all'));

        HttpClientResponse response = await request.close();

        String responseBody = await response.transform(utf8.decoder).join();
        if (response.statusCode == 200) {
          var decodedJson = jsonDecode(responseBody);

          List<Photo> mappedJson = List<Photo>.from(
              decodedJson.map((photoJson) => Photo.fromJson(photoJson)));

          for (var i = 0; i < mappedJson.length; i++) {
            result.add(mappedJson[i].base64);
          }
        } else {
          // Handle failure or error response codes
          print(
              'Failed to get all images: $responseBody ${response.statusCode}');
        }
      
    } catch (e) {
      print('Error getting images: $e');
    } finally {
      httpClient.close();
    }
    return result;
  }

  // Sends a base64 encoded image to the API
  Future<String> addImage(String base64string) async {
    try {
      // Construct the POST request
      final request =
          await httpClient.postUrl(Uri.parse("$_baseUrl/image/add"));

      // Add headers for content-type.
      request.headers.set(HttpHeaders.authorizationHeader,
          'Bearer ${_flutterSecureStorage.read(key: 'Authorization')}');
      request.headers.set(HttpHeaders.contentTypeHeader, "application/json");
      // Payload. Mapped key value pairs.
      Map<String, String> jsonPayload = {
        "base64": base64string,
      };

      // Write the payload to the request
      // request.write(jsonEncode(jsonPayload));
      request.add(utf8.encode(jsonEncode(jsonPayload)));

      // Send the request and wait for the response.
      final response = await request.close();

      // Read the response.
      if (response.statusCode == HttpStatus.ok) {
        return "Image taken succesfully";
      } else if (response.statusCode == HttpStatus.forbidden ||
          response.statusCode == HttpStatus.unauthorized) {
        return "Not authorized to take picture";
      } else {
        return "Error taking picture";
      }
    } catch (e) {
      return "Error communicating with server $e";
    }
  }

  Future<String> login(Credentials credentials) async {
    try {
      // Construct the POST request
      final HttpClientRequest request =
          await httpClient.postUrl(Uri.parse("$_baseUrl/auth"));

      request.headers.set(HttpHeaders.contentTypeHeader, "application/json");

      // Payload. Mapped key value pairs.
      Map<String, String> jsonPayload = {
        "username": credentials.username,
        "privateKey": credentials.privateKey
      };

      // Write the payload to the request
      // request.write(jsonEncode(jsonPayload));
      request.add(utf8.encode(jsonEncode(jsonPayload)));
      // Send the request and wait for the response.
      final response = await request.close();

      String responseBody = await response.transform(utf8.decoder).join();
      // Read the response.
      if (response.statusCode == HttpStatus.ok) {
        _flutterSecureStorage.write(key: 'Authorization', value: responseBody);
        return "Authorized to take picture";
      } else if (response.statusCode == HttpStatus.forbidden ||
          response.statusCode == HttpStatus.unauthorized) {
        return "Not authorized to take picture";
      } else {
        return "Error taking picture";
      }
    } catch (e) {
      print(e);
      return "";
    }
  }
}
