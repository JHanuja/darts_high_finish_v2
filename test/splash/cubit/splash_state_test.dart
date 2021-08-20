import 'package:darts_high_finish_v2/splash/cubit/splash_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Splash State Test', () {
    test('support value comparison Splash Initial', () {
      expect(SplashInitial(), SplashInitial());
      expect(SplashFinished(), SplashFinished());
    });
  });
}
