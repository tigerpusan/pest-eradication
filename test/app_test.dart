import 'package:flutter_test/flutter_test.dart';
import 'package:pest_eradication/app.dart';

void main() {
  testWidgets('shows title and four weapons', (tester) async {
    await tester.pumpWidget(const PestEradicationApp());
    expect(find.text('해충 박멸'), findsOneWidget);
    expect(find.text('권총'), findsOneWidget);
    expect(find.text('장총'), findsOneWidget);
    expect(find.text('새총'), findsOneWidget);
    expect(find.text('젓가락'), findsOneWidget);
  });
}
