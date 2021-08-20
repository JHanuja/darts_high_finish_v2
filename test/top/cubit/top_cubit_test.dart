import 'package:bloc_test/bloc_test.dart';
import 'package:darts_high_finish_v2/top/cubit/top_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Top Cubit Test', () {
    test('Initial State', () {
      expect(TopCubit().state, TopState());
    });

    blocTest<TopCubit, TopState>('update SafeAreaHeight',
        build: () => TopCubit(),
        act: (cubit) => cubit.updateSafeAreaHeight(10.0),
        expect: () => [TopState(safeAreaHeight: 10.0)]);

    blocTest<TopCubit, TopState>('update width',
        build: () => TopCubit(),
        act: (cubit) => cubit.updateValues(10.0),
        expect: () => [
              TopState(
                  width: 10.0,
                  value1: 10.0 * 0.022,
                  value2: 10.0 * 0.033,
                  value3: 10.0 * 0.044,
                  value4: 10.0 * 0.088)
            ]);

    test('all values are set', () {
      TopCubit t = TopCubit();
      t.updateSafeAreaHeight(10.0);
      t.updateValues(20.0);
      expect(t.allValuesAreSet(), true);
    });
  });
}
