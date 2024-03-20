import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutterapp2/models/photo.dart';
import 'package:universal_io/io.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutterapp2/data/repository/photo_repo_interface.dart';
class PhotoService implements IPhotoRepo {
  late String _baseUrl; // Initialized in constructor

  HttpClient httpClient = HttpClient();

  final FlutterSecureStorage _flutterSecureStorage =
      const FlutterSecureStorage(); // FSS used to store and read

  PhotoService() {
    if (kIsWeb) {
      _baseUrl = 'http://127.0.0.1:5135/api';
    } else {
      _baseUrl = 'http://10.0.2.2:5135/api';
    }
  }

  // Fetches a list of images (as base64 strings) from the API
  @override
  Future<List<Photo>> getAll() async {
    try {

      HttpClientRequest request =
          await httpClient.getUrl(Uri.parse('$_baseUrl/image/all'));

      HttpClientResponse response = await request.close();

      String responseBody = await response.transform(utf8.decoder).join();

      if (response.statusCode >= 200 || response.statusCode < 300) {
        List<dynamic> decodedJson = jsonDecode(responseBody);

        return decodedJson
            .map((jsonItem) => Photo.fromMap(jsonItem as Map<String, dynamic>))
            .toList();

      } else {
        // Handle failure or error response codes
        throw Exception("Status code: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint('Error getting images: $e');
      return [];
    } 
    // finally {
    //   httpClient.close();
    // }
  }

  // Sends a base64 encoded image to the API
  @override
  Future<void> add(String base64string) async {
    try {

      // Construct the POST request
      final request =
          await httpClient.postUrl(Uri.parse("$_baseUrl/image/add"));

      // Add request headers, Authorization & contentType
      request.headers.set(HttpHeaders.authorizationHeader,
      'Bearer ${await _flutterSecureStorage.read(key: 'Authorization')}');
      request.headers.set(HttpHeaders.contentTypeHeader, "application/json");

      // Payload. Mapped key value pairs.
      Map<String, String> jsonPayload = {
        "base64": base64string,
      };

      // Write the payload to the request
      // request.write(jsonEncode(jsonPayload));
      request.add(utf8.encode(jsonEncode(jsonPayload)));

      // Send the request and wait for the response.
      await request.close();

      // Read the response
      // switch (response.statusCode) {
      //   case HttpStatus.ok: // Write JWT to FSS
      //     return "Image taken!";
      //   case HttpStatus.unauthorized:
      //     return "Not authorized to save picture";
      //   case HttpStatus.forbidden:
      //     return "Forbidden";
      //   case HttpStatus.badRequest:
      //     return "Bad Request";
      //   default:
      //     return "Unknown Error has occoured. Status Code: ${response.statusCode}";
      // }
    } catch (e) {
      rethrow;
    }
  }
}
