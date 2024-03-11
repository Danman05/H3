import 'package:flutter/material.dart';

class PhotoProvider extends ChangeNotifier {

  // Private list<String>
  late List<String> _photos;

  // Public property get private list<string>
  List<String> get photos => _photos;


  /// add base64 converted image to list
  addToList(String base64Img) {
    _photos.add(base64Img);
    notifyListeners();
  }

}