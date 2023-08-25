import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pc_url/features/convert-url/views/pages/convert_url_page.dart';

void main() {
  testWidgets('ConvertUrlPage Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: ConvertUrlPage(),
        ),
      ),
    );

    expect(find.byType(ConvertUrlPage), findsOneWidget);
  });
}
