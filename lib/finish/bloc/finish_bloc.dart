import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:darts_high_finish_v2/finish/cubit/wait_ways_cubit.dart';
import 'package:darts_high_finish_v2/finish/finish_service/finish.dart';
import 'package:equatable/equatable.dart';

part 'finish_event.dart';
part 'finish_state.dart';

class FinishBloc extends Bloc<FinishEvent, FinishState> {
  final Finish finish;
  final WaitWaysCubit cubit;

  FinishBloc(
      {required int d1,
      required int d2,
      required int gameMode,
      required this.cubit})
      : finish = Finish(d1: d1, d2: d2, gameMode: gameMode),
        super(FinishInitial());

  @override
  Stream<FinishState> mapEventToState(
    FinishEvent event,
  ) async* {
    if (event is GameStarted) {
      yield* _mapGameStartedToState(event);
    }
    if (event is ScoreEntered) {
      yield* _mapScoreEnteredToState(event);
    }
    if (event is GameReset) {
      yield* _mapGameResetToState(event);
    }
    if (event is ScoreReset) {
      yield* _mapScoreResetToState(event);
    }
  }

  Stream<FinishState> _mapGameStartedToState(GameStarted event) async* {
    if (finish.score >= 60 && finish.score <= 170) {
      cubit.startTimer();
      yield (FinishInRange(
          scoreEntered: 0,
          average: finish.average,
          dartsNeeded: finish.dartsNeededForLeg,
          error: false,
          d1: finish.d1,
          d2: finish.d2,
          score: finish.score,
          standartWay: finish.standartWay,
          waysD1: finish.waysD1,
          waysD2: finish.waysD2));
    } else {
      yield (FinishOutOfRange(
        scoreEntered: 0,
        score: finish.score,
        error: false,
        average: finish.average,
        dartsNeeded: finish.dartsNeededForLeg,
      ));
    }
  }

  Stream<FinishState> _mapScoreEnteredToState(ScoreEntered event) async* {
    if (finish.updateScore(event.score, event.dartsNeeded)) {
      if (finish.score >= 60 && finish.score <= 170) {
        if (event.score > 0) {
          cubit.startTimer();
        }
        yield (FinishInRange(
            scoreEntered: event.score,
            average: finish.average,
            dartsNeeded: finish.dartsNeededForLeg,
            error: false,
            d1: finish.d1,
            d2: finish.d2,
            score: finish.score,
            standartWay: finish.standartWay,
            waysD1: finish.waysD1,
            waysD2: finish.waysD2));
      } else {
        yield (FinishOutOfRange(
            scoreEntered: event.score,
            average: finish.average,
            dartsNeeded: finish.dartsNeededForLeg,
            score: finish.score,
            error: false));
      }
    } else {
      if (finish.score >= 60 && finish.score <= 170) {
        yield (FinishInRange(
            scoreEntered: event.score,
            average: finish.average,
            dartsNeeded: finish.dartsNeededForLeg,
            error: true,
            d1: finish.d1,
            d2: finish.d2,
            score: finish.score,
            standartWay: finish.standartWay,
            waysD1: finish.waysD1,
            waysD2: finish.waysD2));
      } else {
        yield (FinishOutOfRange(
            scoreEntered: event.score,
            average: finish.average,
            dartsNeeded: finish.dartsNeededForLeg,
            score: finish.score,
            error: true));
      }
    }
  }

  Stream<FinishState> _mapGameResetToState(GameReset event) async* {
    finish.resetMatch();
    if (finish.score >= 60 && finish.score <= 170) {
      yield (FinishInRange(
          scoreEntered: 0,
          average: finish.average,
          dartsNeeded: finish.dartsNeededForLeg,
          error: false,
          d1: finish.d1,
          d2: finish.d2,
          score: finish.score,
          standartWay: finish.standartWay,
          waysD1: finish.waysD1,
          waysD2: finish.waysD2));
    } else {
      yield (FinishOutOfRange(
          scoreEntered: 0,
          average: finish.average,
          dartsNeeded: finish.dartsNeededForLeg,
          score: finish.score,
          error: false));
    }
  }

  Stream<FinishState> _mapScoreResetToState(ScoreReset event) async* {
    if (finish.resetScore()) {
      yield FinishOutOfRange(
          score: finish.score,
          error: false,
          average: finish.average,
          dartsNeeded: finish.dartsNeededForLeg,
          scoreEntered: 0);
    }
  }

  @override
  Future<void> close() {
    cubit.close();
    return super.close();
  }
}
