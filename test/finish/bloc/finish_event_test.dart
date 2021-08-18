import 'package:darts_high_finish_v2/finish/bloc/finish_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Finish Event', () {
    group('GameStarted', () {
      test('support value comparison', () {
        expect(GameStarted(), GameStarted());
      });
    });
    group('GameReset', () {
      test('support value comparison', () {
        expect(GameReset(), GameReset());
      });
    });
    group('Score Entered', () {
      test('support value comparison', () {
        expect(ScoreEntered(score: 60, dartsNeeded: 3), ScoreEntered(score:60,dartsNeeded: 3));
      });
    });
  });
}
