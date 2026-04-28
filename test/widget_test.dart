import 'package:flutter_test/flutter_test.dart';
import 'package:azkar/main.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const AzkarApp());
    await tester.pump();
    expect(find.text('أذكار'), findsOneWidget);
  });
}
