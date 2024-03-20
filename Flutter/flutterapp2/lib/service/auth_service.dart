import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutterapp2/models/credentials.dart';

class AuthService {
  late String _baseUrl; // Initialized in constructor

  HttpClient httpClient = HttpClient();

  final FlutterSecureStorage _flutterSecureStorage =
      const FlutterSecureStorage(); // FSS used to store and read

  // Construct endpoint based on client's device
  AuthService() {
    if (kIsWeb) {
      _baseUrl = 'http://127.0.0.1:5135/api';
    } else {
      _baseUrl = 'http://10.0.2.2:5135/api';
    }
  }

   Future<String> login(Credentials credentials) async {
    try {

      // Construct the POST request
      final HttpClientRequest request =
          await httpClient.postUrl(Uri.parse("$_baseUrl/auth"));

      // Request headers
      request.headers.set(HttpHeaders.contentTypeHeader, "application/json");

      // Payload. Mapped key value pairs.
      Map<String, String> jsonPayload = {
        "username": credentials.username,
        "privateKey": credentials.privateKey
      };

      // Add the payload to the request
      request.add(utf8.encode(jsonEncode(jsonPayload)));

      // Send the request and wait for the response.
      final response = await request.close();

      String responseBody = await response.transform(utf8.decoder).join();

      // Read the response
      switch (response.statusCode) {
        case HttpStatus.ok: // Write JWT to FSS
          _flutterSecureStorage.write(key: 'Authorization', value: responseBody);
          return "Authorized!";
        case HttpStatus.unauthorized:
          return "Not Authorized";
        case HttpStatus.forbidden:
          return "Forbidden";
        case HttpStatus.badRequest:
          return "Bad Request";
        default:
        return "Unknown Error has occoured. Status Code: ${response.statusCode}";
      }
    } catch (e) {
      debugPrint(e.toString());
      return "Error occoured during authorization";
    }
  }
}
