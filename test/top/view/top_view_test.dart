import 'package:darts_high_finish_v2/main.dart';
import 'package:darts_high_finish_v2/top/view/top_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'test Top View',
    (tester) async {
      await tester.pumpWidget(MyApp(child: TopView(child: Text('123'))));
      expect(find.text('123'), findsOneWidget);
    },
  );
}
