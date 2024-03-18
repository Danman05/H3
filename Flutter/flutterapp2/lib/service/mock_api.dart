import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'dart:io';
class MockClient  {

  static final List<String> _images = [
    base64Encode(File('${Directory.current.path}\\lib\\assets\\images\\img1.jpg').readAsBytesSync()),
     base64Encode(File('${Directory.current.path}\\lib\\assets\\images\\img2.jpg').readAsBytesSync())
     ];


  @visibleForTesting
  List<String> get images => _images;
  // static const String _baseUrl = 'http://10.0.2.2:5135/api';
  HttpClient httpClient = HttpClient();

  // Get all images with a simulated delay
  Future<List<String>> getAll() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return _images;
  }

  // Sends a base64 encoded image to the API
  Future<bool> addImage(String base64string) async {
    try {
      _images.add(base64string);
      return true;
    } catch (ex) {
      return false;
    }
  }

}
