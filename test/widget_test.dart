// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:isic_app/main.dart';

void main() {
  testWidgets('Student dashboard loads correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const StudentDashboardApp());

    // Verify that the student name is displayed.
    expect(find.text('Tomas Soucek'), findsOneWidget);
    
    // Verify that the university name is displayed.
    expect(find.text('University of Southern Denmark'), findsOneWidget);
    
    // Verify that the ID number is displayed.
    expect(find.text('S045001008934Q'), findsOneWidget);
    
    // Verify that sections are present.
    expect(find.text('Novinky'), findsOneWidget);
    expect(find.text('Limitované nabídky'), findsOneWidget);
  });
}
