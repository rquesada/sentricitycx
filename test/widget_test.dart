import 'package:flutter_test/flutter_test.dart';
import 'package:sentricitycx/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const SentricityCXApp());
    expect(find.byType(SentricityCXApp), findsOneWidget);
  });
}
