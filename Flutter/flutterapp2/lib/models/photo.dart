
import 'dart:convert';

/*
  Photo class implementation

 */

class Photo {

  final String base64; 

  const Photo({
    required this.base64
  });

  /// 
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> result = <String, dynamic>{};
    result.addAll({'base64': base64});
    return result;
  }
  factory Photo.fromMap(Map<String, dynamic> map) {
    return Photo(
      base64: map['base64'] ?? "0",
    );
  }

  String toJson() => json.encode(toMap());

  factory Photo.fromJson(String source) =>
      Photo.fromMap(json.decode(source));
  @override
  String toString() {
    return 'photo($base64)';
  }

}