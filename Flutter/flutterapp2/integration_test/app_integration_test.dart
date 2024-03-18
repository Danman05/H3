import 'package:flutter/material.dart';
import 'package:flutterapp2/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
void main() {
  
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Camera App walkthrough', () 
  {
      testWidgets('navigate from home screen to camera screen by drawer', (widgetTester) async {

        await widgetTester.pumpWidget(MyApp());

        await widgetTester.tap(find.byIcon(Icons.menu));

        await widgetTester.pumpAndSettle();

        await widgetTester.tap(find.byType(ListTile).at(0));

        await widgetTester.pumpAndSettle();
           
        // final fab = find.byKey(const Key('take_picture_fab'));
        // await widgetTester.tap(fab);

        // await widgetTester.pumpAndSettle();

      }); 
  });
}