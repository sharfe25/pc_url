import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pc_url/features/history/views/pages/history.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  testWidgets('History Widget Test', (WidgetTester tester) async {

    await tester.pumpWidget(
      const MaterialApp(
        home: History(),
      ),
    );

    expect(find.text("Historial"), findsOneWidget);
  });
}
