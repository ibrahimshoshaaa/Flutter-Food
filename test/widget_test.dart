import 'package:flutter_test/flutter_test.dart';

import 'package:foodly/main.dart';

void main() {
  testWidgets('app starts successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const Foodly());
    await tester.pumpAndSettle(const Duration(seconds: 3));

    expect(find.byType(Foodly), findsOneWidget);
    expect(find.text('Foodly'), findsOneWidget);
  });
}
