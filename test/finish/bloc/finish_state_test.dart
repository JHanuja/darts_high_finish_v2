import 'package:darts_high_finish_v2/finish/bloc/finish_bloc.dart';
import 'package:darts_high_finish_v2/finish/finish_service/finish.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FinishState', () {
    Finish finish = Finish(gameMode: 3, d1: 20, d2: 18,setModeLegMode: false, legsToWinMatch: 10, setsToWinMatch: 10,legsToWinSet: 4);

    group('FinishInitial', () {
      test('support value comparison', () {
        expect(FinishInitial(false, finish), FinishInitial(false, finish));
      });
    });
    group('Finish Out of Range', () {
      test('support value comparison', () {
        expect(FinishOutOfRange(scoreEntered: 0, finish: finish, error: false),
            FinishOutOfRange(scoreEntered: 0, finish: finish, error: false));
      });
    });
    group('Finish in range', () {
      test('support value comparison', () {
        expect(
          FinishInRange(
            scoreEntered: 0,
            finish: finish,
            error: false,
          ),
          FinishInRange(
            scoreEntered: 0,
            finish: finish,
            error: false,
          ),
        );
      });
    });
  });
}
