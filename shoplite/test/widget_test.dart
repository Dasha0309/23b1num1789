// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:shoplite/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const ShopLiteApp());

    expect(find.text('0'), findsWidgets);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsWidgets);
  });

  testWidgets('Decrement and reset buttons work', (WidgetTester tester) async {
    await tester.pumpWidget(const ShopLiteApp());

    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('2'), findsWidgets);

    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();
    expect(find.text('1'), findsWidgets);

    await tester.tap(find.byIcon(Icons.refresh));
    await tester.pump();
    expect(find.text('0'), findsWidgets);
    expect(find.text('-1'), findsNothing);
  });

  testWidgets('If counter reaches 10 it will not allow to add more',
          (WidgetTester tester) async {
            await tester.pumpWidget(const ShopLiteApp());

            for (var i = 0; i < 10; i++) {
              await tester.tap(find.byIcon(Icons.add));
              await tester.pump();
            }

            expect(find.text('10'), findsWidgets);
            expect(find.text('Нэг удаад 10-аас олон бараа захиалах боломжгүй'),
                findsOneWidget);

            final addButton = tester.widget<FloatingActionButton>(
                find.widgetWithIcon(FloatingActionButton, Icons.add));
            expect(addButton.onPressed, isNull);

            await tester.tap(find.byIcon(Icons.refresh));
            await tester.pump();
            expect(find.text('0'), findsWidgets);
          });
}