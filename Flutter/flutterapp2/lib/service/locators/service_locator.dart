import 'package:flutterapp2/service/auth_service.dart';
import 'package:flutterapp2/service/mock_photo_api.dart';
import 'package:flutterapp2/service/photo_api.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => MockPhotoService());
  locator.registerLazySingleton(() => PhotoService());
  locator.registerLazySingleton(() => AuthService());
}