import 'package:darts_high_finish_v2/doubles/view/doubles_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DoublesView', () {
    testWidgets('Double Buttons rendered', (tester) async {
      await tester.pumpWidget(MaterialApp(home: DoublesPage()));
      expect(find.text('D20'), findsNWidgets(2));
      expect(find.text('D18'), findsNWidgets(2));
      expect(find.text('D16'), findsNWidgets(2));
      expect(find.text('D14'), findsNWidgets(2));
      expect(find.text('D12'), findsNWidgets(2));
    });
  });
}
