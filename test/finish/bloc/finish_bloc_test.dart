import 'package:bloc_test/bloc_test.dart';
import 'package:darts_high_finish_v2/finish/bloc/finish_bloc.dart';
import 'package:darts_high_finish_v2/finish/cubit/wait_ways_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FinishBloc', () {
    test('initialStateIsFinishInitial', () {
      expect(FinishBloc(cubit: WaitWaysCubit(),gameMode: 1, d1: 20, d2: 18).state, FinishInitial());
    });
    blocTest<FinishBloc, FinishState>('checks Game Start works Out of Range',
        build: () => FinishBloc(cubit: WaitWaysCubit(), gameMode: 3, d1: 20, d2: 18),
        act: (bloc) => bloc.add(const GameStarted()),
        expect: () => [
              FinishOutOfRange(
                  scoreEntered: 0,
                  dartsNeeded: 0, average: 0.0, score: 301, error: false)
            ]);
    blocTest<FinishBloc, FinishState>('checks Update Score',
        build: () => FinishBloc(cubit: WaitWaysCubit(),gameMode: 3, d1: 20, d2: 18),
        act: (bloc) {
          bloc.add(const GameStarted());
          bloc.add(const ScoreEntered(score: 131, dartsNeeded: 3));
          bloc.add(const ScoreEntered(score: 200, dartsNeeded: 3));
        },
        expect: () => [
              FinishOutOfRange(
                scoreEntered: 0,
                  dartsNeeded: 0, average: 0.0, score: 301, error: false),
              FinishInRange(
                scoreEntered: 131,
                  dartsNeeded: 3,
                  average: 131.0,
                  error: false,
                  score: 170,
                  standartWay: "T20  T20  Bull",
                  waysD1: [],
                  waysD2: [],
                  d1: 20,
                  d2: 18),
              FinishInRange(
                scoreEntered: 200,
                  dartsNeeded: 3,
                  average: 131.0,
                  error: true,
                  score: 170,
                  standartWay: "T20  T20  Bull",
                  waysD1: [],
                  waysD2: [],
                  d1: 20,
                  d2: 18)
            ]);
    blocTest<FinishBloc, FinishState>('checks Reset Match Works',
        build: () => FinishBloc(cubit: WaitWaysCubit(), d1: 20, d2: 18, gameMode: 3),
        act: (bloc) {
          bloc.add(const GameStarted());
          bloc.add(const ScoreEntered(score: 131, dartsNeeded: 3));
          bloc.add(GameReset());
        },
        expect: () => [
              FinishOutOfRange(
                scoreEntered: 0,
                  dartsNeeded: 0, average: 0.0, score: 301, error: false),
              FinishInRange(
                  scoreEntered: 131,
                  dartsNeeded: 3,
                  average: 131.0,
                  error: false,
                  score: 170,
                  standartWay: "T20  T20  Bull",
                  waysD1: [],
                  waysD2: [],
                  d1: 20,
                  d2: 18),
              FinishOutOfRange(
                  scoreEntered: 0,
                  dartsNeeded: 0, average: 131.0, score: 301, error: false),
            ]);
  });
}
