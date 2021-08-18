import 'package:bloc_test/bloc_test.dart';
import 'package:darts_high_finish_v2/finish/bloc/finish_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FinishBloc', () {
    test('initialStateIsFinishInitial', () {
      expect(FinishBloc(score: 170, d1: 20, d2: 18).state, FinishInitial());
    });
    blocTest<FinishBloc, FinishState>('checks Game Start works In Range',
        build: () => FinishBloc(score: 170, d1: 20, d2: 18),
        act: (bloc) => bloc.add(const GameStarted()),
        expect: () => [
              FinishInRange(
                  score: 170,
                  standartWay: "T20  T20  Bull",
                  waysD1: [],
                  waysD2: [],
                  d1: 20,
                  d2: 18)
            ]);
    blocTest<FinishBloc, FinishState>('checks Game Start works Out of Range',
        build: () => FinishBloc(score: 250, d1: 20, d2: 18),
        act: (bloc) => bloc.add(const GameStarted()),
        expect: () => [FinishOutOfRange(250)]);
    blocTest<FinishBloc, FinishState>('checks Update Score',
        build: () => FinishBloc(score: 250, d1: 20, d2: 18),
        act: (bloc) {
          bloc.add(const GameStarted());
          bloc.add(const ScoreEntered(score: 80, dartsNeeded: 3));
        },
        expect: () => [
              FinishOutOfRange(250),
              FinishInRange(
                  score: 170,
                  standartWay: "T20  T20  Bull",
                  waysD1: [],
                  waysD2: [],
                  d1: 20,
                  d2: 18)
            ]);
    blocTest<FinishBloc, FinishState>('checks Reset Match Works',
        build: () => FinishBloc(score: 250, d1: 20, d2: 18),
        act: (bloc) {
          bloc.add(const GameStarted());
          bloc.add(const ScoreEntered(score: 80, dartsNeeded: 3));
          bloc.add(GameReset());
        },
        expect: () => [
              FinishOutOfRange(250),
              FinishInRange(
                  score: 170,
                  standartWay: "T20  T20  Bull",
                  waysD1: [],
                  waysD2: [],
                  d1: 20,
                  d2: 18),
              FinishOutOfRange(250),
            ]);
  });
}
