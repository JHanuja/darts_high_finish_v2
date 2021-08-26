import 'package:bloc_test/bloc_test.dart';
import 'package:darts_high_finish_v2/finish/cubit/wait_ways_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Wait Ways Cubit', () {
    test('initial state', () {
      expect(WaitWaysCubit().state, 0);
    });
  });
  group('Wait Ways Cubit after 5 seconds', () {
    blocTest<WaitWaysCubit, int>('test Wait Ways State after 5 secs',
        build: () => WaitWaysCubit(),
        act: (cubit) => cubit.startTimer(),
        wait: const Duration(seconds: 5),
        expect: () => [0, 1]);
  });

  group('Wait Ways Cubit after 15 seconds', () {
    blocTest<WaitWaysCubit, int>('test Wait Ways State after 15 secs',
        build: () => WaitWaysCubit(),
        act: (cubit) => cubit.startTimer(),
        wait: const Duration(seconds: 16),
        expect: () => [0, 1, 2]);
  });
}
