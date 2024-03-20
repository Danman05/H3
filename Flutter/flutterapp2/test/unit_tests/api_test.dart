import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutterapp2/service/mock_photo_api.dart';

// final ApiService _apiService = ApiService();
final MockPhotoService _mockClient = MockPhotoService(); // Mock API
void main() async {
  //
  group('API Service Tests', () {
    test('Send Image returns true on successful upload', () async {
      // Mock the ApiService.sendImage function to return true for this test
      final bool result = await _mockClient.addImage(
        base64Encode(
              File('${Directory.current.path}\\lib\\assets\\images\\img3.jpg')
              .readAsBytesSync()));
      expect(result, true);
    });

    test('Get All images, collection of strings on retrival', () async {
      final List<String> result = await _mockClient.getAll();
      expect(result.isNotEmpty, true );
    });

    // test('Convert base64 to image', () async {
    //   final File = await MockClient().
    // });
  });
}
