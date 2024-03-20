import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterapp2/camera.dart';
import 'package:flutterapp2/main.dart';

void main() {
  group('Widget Tests', () {

    testWidgets('Verify widget existence', (widgetTester) async {
      await widgetTester.pumpWidget(const MaterialApp(home: MyHomePage(title: "Widget Test")));

      Finder widget = find.byType(Scaffold);

      expect(widget, findsOneWidget);
    });
  });
}
