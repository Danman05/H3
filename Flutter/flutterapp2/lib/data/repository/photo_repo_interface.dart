import 'package:flutterapp2/models/photo.dart';

abstract class IPhotoRepo {
  Future<List<Photo>> getAll();
  Future<void> add(String base64);

}
