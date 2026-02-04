import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_lms_mvp/screens/home_page.dart';

void main() {
  testWidgets('HomePage has a title and course cards', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomePage()));

    // Verify that the title is present
    expect(find.text('Courses'), findsOneWidget);

    // Verify that course cards are displayed
    expect(find.byType(CourseCard), findsWidgets);
  });
}