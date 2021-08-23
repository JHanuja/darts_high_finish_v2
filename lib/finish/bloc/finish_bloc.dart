import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:darts_high_finish_v2/finish/finish_service/finish.dart';
import 'package:equatable/equatable.dart';

part 'finish_event.dart';
part 'finish_state.dart';

class FinishBloc extends Bloc<FinishEvent, FinishState> {
  final Finish finish;

  FinishBloc({required int d1, required int d2, required int gameMode})
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
  }

  Stream<FinishState> _mapGameStartedToState(GameStarted event) async* {
    if (finish.score >= 60 && finish.score <= 170) {
      yield (FinishInRange(
          error: false,
          d1: finish.d1,
          d2: finish.d2,
          score: finish.score,
          standartWay: finish.standartWay,
          waysD1: finish.waysD1,
          waysD2: finish.waysD2));
    } else {
      yield (FinishOutOfRange(score: finish.score,error:false));
    }
  }

  Stream<FinishState> _mapScoreEnteredToState(ScoreEntered event) async* {
    if (finish.updateScore(event.score, event.dartsNeeded)) {
      if (finish.score >= 60 && finish.score <= 170) {
        yield (FinishInRange(
            error: false,
            d1: finish.d1,
            d2: finish.d2,
            score: finish.score,
            standartWay: finish.standartWay,
            waysD1: finish.waysD1,
            waysD2: finish.waysD2));
      } else {
        yield (FinishOutOfRange(score: finish.score,error:false));
      }
    } else {
      print('I am here');
      
      if (finish.score >= 60 && finish.score <= 170) {
        yield (FinishInRange(
            error: true,
            d1: finish.d1,
            d2: finish.d2,
            score: finish.score,
            standartWay: finish.standartWay,
            waysD1: finish.waysD1,
            waysD2: finish.waysD2));
      } else {
        yield (FinishOutOfRange(score:finish.score,error:true));
      }
    }
  }

  Stream<FinishState> _mapGameResetToState(GameReset event) async* {
    finish.resetMatch();
    if (finish.score >= 60 && finish.score <= 170) {
      yield (FinishInRange(
          error: false,
          d1: finish.d1,
          d2: finish.d2,
          score: finish.score,
          standartWay: finish.standartWay,
          waysD1: finish.waysD1,
          waysD2: finish.waysD2));
    } else {
      yield (FinishOutOfRange(score: finish.score,error:false));
    }
  }
}
