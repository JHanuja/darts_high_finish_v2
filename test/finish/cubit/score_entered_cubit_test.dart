import 'package:darts_high_finish_v2/finish/cubit/score_entered_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Score entered Cubit', () {
    test('Initial is 0', () {
      expect(ScoreEnteredCubit().state, "");
    });
    test('Enter Score', () {
      ScoreEnteredCubit s = ScoreEnteredCubit();
      s.append9();
      s.append1();
      expect(s.state, "91");
    });
  });
}
