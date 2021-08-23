import 'package:bloc_test/bloc_test.dart';
import 'package:darts_high_finish_v2/finish/bloc/finish_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FinishBloc', () {
    test('initialStateIsFinishInitial', () {
      expect(FinishBloc(gameMode: 1, d1: 20, d2: 18).state, FinishInitial());
    });
    blocTest<FinishBloc, FinishState>('checks Game Start works Out of Range',
        build: () => FinishBloc(gameMode: 3, d1: 20, d2: 18),
        act: (bloc) => bloc.add(const GameStarted()),
        expect: () => [FinishOutOfRange(score:301,error:false)]);
    blocTest<FinishBloc, FinishState>('checks Update Score',
        build: () => FinishBloc(gameMode: 3, d1: 20, d2: 18),
        act: (bloc) {
          bloc.add(const GameStarted());
          bloc.add(const ScoreEntered(score: 131, dartsNeeded: 3));
          bloc.add(const ScoreEntered(score: 200, dartsNeeded: 3));
        },
        expect: () => [
              FinishOutOfRange(score:301,error:false),
              FinishInRange(
                  error: false,
                  score: 170,
                  standartWay: "T20  T20  Bull",
                  waysD1: [],
                  waysD2: [],
                  d1: 20,
                  d2: 18),
              FinishInRange(
                  error: true,
                  score: 170,
                  standartWay: "T20  T20  Bull",
                  waysD1: [],
                  waysD2: [],
                  d1: 20,
                  d2: 18)
            ]);
    blocTest<FinishBloc, FinishState>('checks Reset Match Works',
        build: () => FinishBloc(d1: 20, d2: 18, gameMode: 3),
        act: (bloc) {
          bloc.add(const GameStarted());
          bloc.add(const ScoreEntered(score: 131, dartsNeeded: 3));
          bloc.add(GameReset());
        },
        expect: () => [
              FinishOutOfRange(score: 301,error:false),
              FinishInRange(
                  error: false,
                  score: 170,
                  standartWay: "T20  T20  Bull",
                  waysD1: [],
                  waysD2: [],
                  d1: 20,
                  d2: 18),
              FinishOutOfRange(score:301,error: false),
            ]);
  });
}
