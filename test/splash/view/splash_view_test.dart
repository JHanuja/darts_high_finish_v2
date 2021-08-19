import 'package:darts_high_finish_v2/splash/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Splash View', () {
    testWidgets('renders Splash View', (tester) async {
      await tester.pumpWidget(MaterialApp(home: SplashView()));
      expect(find.text('Darts High Finish'), findsOneWidget);
    });
  });
}
