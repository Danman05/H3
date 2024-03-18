import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterapp2/camera.dart';
import 'package:flutterapp2/main.dart';

void main() {
  group('Widget Tests', () {

    testWidgets('Verify widget existence', (widgetTester) async {
      await widgetTester.pumpWidget(MaterialApp(home: MyHomePage(title: "Widget Test")));

      Finder fab = find.byType(Scaffold);

      expect(fab, findsOneWidget);
    });
  });
}
