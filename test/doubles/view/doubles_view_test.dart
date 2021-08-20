import 'package:darts_high_finish_v2/doubles/view/doubles_view.dart';
import 'package:darts_high_finish_v2/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DoublesView', () {
    testWidgets('Double Buttons rendered', (tester) async {
      await tester.pumpWidget(MyApp(child: DoublesPage()));
      expect(find.text('D20'), findsNWidgets(2));
      expect(find.text('D18'), findsNWidgets(2));
      expect(find.text('D16'), findsNWidgets(2));
      expect(find.text('D14'), findsNWidgets(2));
      expect(find.text('D12'), findsNWidgets(2));
      expect(find.text('100-170'), findsOneWidget);
      expect(find.text('170-301'), findsOneWidget);
      expect(find.text('301'), findsOneWidget);
      expect(find.text('501'), findsOneWidget);
      expect(find.text('Game On'), findsOneWidget);

    });
  });
}
