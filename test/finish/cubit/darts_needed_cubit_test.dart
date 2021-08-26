import 'package:darts_high_finish_v2/finish/cubit/darts_needed_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Darts Needed Cubit', () {
    test('Initial State is 0', () {
      expect(DartsNeededCubit().state, 3);
    });

    test('increment Darts Needed', () {
      DartsNeededCubit d = DartsNeededCubit();
      d.oneDartNeeded();
      expect(d.state, 1);
      d.twoDartsNeeded();
      expect(d.state, 2);
      d.threeDartsNeeded();
      expect(d.state, 3);
    });
  });
}
