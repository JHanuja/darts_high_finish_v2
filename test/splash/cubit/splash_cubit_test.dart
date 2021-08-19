import 'package:bloc_test/bloc_test.dart';
import 'package:darts_high_finish_v2/splash/cubit/splash_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Splash Cubit', () {
    group('Initial State', () {
      test('Initial State is SplashInitial', () {
        expect(SplashCubit().state, SplashInitial());
      });
    });
    group('start Timer', () {
      blocTest<SplashCubit, SplashState>(
        'check if after three seconds Splash Finished is emitted',
        build: () => SplashCubit(),
        act: (cubit) => cubit.startTimer(),
        wait: Duration(seconds: 3),
        expect: () => [SplashFinished()]
      );
    });
  });
}
