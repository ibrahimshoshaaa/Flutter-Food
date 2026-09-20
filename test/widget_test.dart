import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_food/main.dart';

void main() {
  testWidgets('Flutter Food app starts successfully', (tester) async {
    await tester.pumpWidget(const FlutterFoodApp());
    await tester.pumpAndSettle();
    expect(find.text('Flutter Food'), findsOneWidget);
    expect(find.text('Explore'), findsOneWidget);
    expect(find.text('Orders'), findsOneWidget);
    expect(find.text('Account'), findsOneWidget);
  });
}
