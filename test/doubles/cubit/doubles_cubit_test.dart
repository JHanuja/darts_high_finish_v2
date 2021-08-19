import 'package:bloc_test/bloc_test.dart';
import 'package:darts_high_finish_v2/doubles/cubit/doubles_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DoublesCubit', () {
    test('initial State', () {
      expect(DoublesCubit().state, DoublesState(d1: 0, d2: 0));
    });
    group('choose Double', () {
      blocTest<DoublesCubit, DoublesState>('test1',
          build: () => DoublesCubit(),
          act: (cubit) => cubit.chooseDouble(d1: 16),
          expect: () => [DoublesState(d1: 16, d2: 0)]);
      blocTest<DoublesCubit, DoublesState>('test2',
          build: () => DoublesCubit(),
          act: (cubit) {
            cubit.chooseDouble(d1: 16);
            cubit.chooseDouble(d2: 20);
            cubit.chooseDouble(d1: 14);
          },
          expect: () => [
                DoublesState(d1: 16, d2: 0),
                DoublesState(d1: 16, d2: 20),
                DoublesState(d1: 14, d2: 20)
              ]);
    });
  });
}
