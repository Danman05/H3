
class Photo {
  final String base64;

  const Photo({required this.base64});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'base64': String base64,
      } => 
        Photo(
          base64: base64
        ),
      _ => throw const FormatException('Failed to load Photo'),
    };
  }
}