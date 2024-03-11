import 'package:camera/camera.dart';

class CameraSingleton {
  CameraDescription? camera;
  static final CameraSingleton _instance = CameraSingleton._internal();
  factory CameraSingleton() {
    return _instance;
  }
  CameraSingleton._internal();
}
