// This is a basic Flutter widget test.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:design_pattern/app.dart';

void main() {
  testWidgets('Lobby Page navigation test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that we can find the lobby with the given title.
    expect(find.text('로비'), findsOneWidget);

    // Tap the '생성 패턴' tile and navigate
    await tester.tap(find.text('생성 패턴'));
    await tester.pumpAndSettle(); // Wait for navigation to complete

    // Verify that we navigate to the expected route (e.g., creational category)
    expect(find.text('구조 패턴'), findsOneWidget);
  });
}
