import 'package:flutter_test/flutter_test.dart';
import 'package:pest_eradication/app.dart';

void main() {
  testWidgets('home shows title and start button', (tester) async {
    await tester.pumpWidget(const PestEradicationApp());
    expect(find.text('해충 박멸'), findsOneWidget);
    expect(find.text('박멸 시작'), findsOneWidget);
  });
}
