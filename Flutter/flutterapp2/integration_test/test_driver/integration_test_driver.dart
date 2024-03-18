import 'dart:io';

import 'package:integration_test/integration_test_driver.dart';

Future<void> main() async {
  await Process.run(
    'adb',
    [
      'shell',
      'pm',
      'grant',
      'com.example.Audiio', 
      'android.permission.ACTION.RECORD_AUDIO'
    ],
  );
    await Process.run(
    'adb',
    [
      'shell',
      'pm',
      'grant',
      'com.example.User'
      'android.permission.ACTION_COARSE_LOCATION'
    ],
  );
  // TODO: Add more permissions as required
  await integrationDriver();
}
