import 'package:bloc_test/bloc_test.dart';
import 'package:darts_high_finish_v2/finish/bloc/finish_bloc.dart';
import 'package:darts_high_finish_v2/finish/cubit/wait_ways_cubit.dart';
import 'package:darts_high_finish_v2/finish/finish_service/finish.dart';
import 'package:darts_high_finish_v2/finish/finish_service/throw.dart';
import 'package:flutter_test/flutter_test.dart';

import '../view/helper.dart';

void main() {

  /*
  group('FinishBloc', () {
    

    test('initialStateIsFinishInitial', () {
      expect(FinishBloc(waitWaysCubit: WaitWaysCubit(), finish: FakeFinish()).state,
          FinishInitial(false, FakeFinish()));
    });
    blocTest<FinishBloc, FinishState>('checks Game Start works Out of Range',
        build: () => FinishBloc(waitWaysCubit: WaitWaysCubit(), finish: FakeFinish()),
        act: (bloc) => bloc.add(const GameStarted()),
        expect: () =>
            [FinishOutOfRange(scoreEntered: 0, finish: FakeFinish(), error: false)]);
    blocTest<FinishBloc, FinishState>('checks Update Score',
        build: () => FinishBloc(waitWaysCubit: WaitWaysCubit(), finish: FakeFinish()),
        act: (bloc) {
          bloc.add(const GameStarted());
          bloc.add(const ScoreEntered(score: 131, dartsNeeded: 3));
          bloc.add(const ScoreEntered(score: 200, dartsNeeded: 3));
        },
        expect: () => [
              FinishOutOfRange(scoreEntered: 0, finish: FakeFinish(), error: false),
              FinishInRange(
                scoreEntered: 131,
                finish: FakeFinish(),
                error: false,
              ),
              FinishInRange(
                scoreEntered: 200,
                finish: FakeFinish(),
                error: true,
              )
            ]);
    
    
    blocTest<FinishBloc, FinishState>('checks Next Leg Works',
        build: () => FinishBloc(waitWaysCubit: WaitWaysCubit(), finish: Finish(d1: 20,d2:18,gameMode: 3)),
        act: (bloc) {
          bloc.add(const GameStarted());
          bloc.add(const ScoreEntered(score: 131, dartsNeeded: 3));
          bloc.add(const ScoreEntered(score: 170, dartsNeeded: 3));
          bloc.add(GameNextLeg());
        },
        expect: () => [
              FinishOutOfRange(scoreEntered: 0, finish: FakeFinish(), error: false),
              FinishInRange(
                scoreEntered: 131,
                finish: FakeFinish(),
                error: false,
              ),
              LegFinished(
                scoreEntered: 170,
                finish: FakeFinish(),
                error: false,
              ),
              FinishOutOfRange(scoreEntered: 0, finish: FakeFinish(), error: false),
            ]);
            
  });
  */
  
}
