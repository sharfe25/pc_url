import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pc_url/features/convert-url/views/widgets/input_url.dart';

void main() {
  testWidgets('InputUrl Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: InputUrl(
            labelText: 'URL',
            controller: TextEditingController(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a URL.';
              }
              return null;
            },
          ),
        ),
      ),
    );

    expect(find.text('URL'), findsOneWidget);

    await tester.tap(find.byType(TextFormField));
    await tester.enterText(find.byType(TextFormField), 'https://example.com');
    await tester.pump();

    expect(find.text('https://example.com'), findsOneWidget);
  });
}
