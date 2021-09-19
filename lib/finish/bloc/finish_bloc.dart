import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:darts_high_finish_v2/finish/cubit/wait_ways_cubit.dart';
import 'package:darts_high_finish_v2/finish/finish_service/finish.dart';
import 'package:darts_high_finish_v2/x01GameProperties/player.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'finish_event.dart';
part 'finish_state.dart';

class FinishBloc extends Bloc<FinishEvent, FinishState> {
  final List<Finish> finishes;
  final List<WaitWaysCubit> waitWaysCubits;
  final List<Player> players;
  late Finish activeFinish;
  late WaitWaysCubit activeWaitWaysCubit;

  late int numberOfPlayers;
  late int scoreUpdates;

  FinishBloc({
    required this.finishes,
    required this.waitWaysCubits,
    required this.players,
  }) : super(FinishInitial(false, finishes[0])) {
    activeFinish = finishes[0];
    activeWaitWaysCubit = waitWaysCubits[0];
    numberOfPlayers = finishes.length;
    scoreUpdates = 0;
  }

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
    if (event is GameNextLeg) {
      yield* _mapGameNextLegToState(event);
    }
    if (event is ScoreReset) {
      yield* _mapScoreResetToState(event);
    }
  }

  Stream<FinishState> _mapGameStartedToState(GameStarted event) async* {
    if (activeFinish.score >= 60 && activeFinish.score <= 170) {
      activeWaitWaysCubit.startTimer();
      yield (FinishInRange(
          scoreEntered: 0, error: false, finish: activeFinish));
    } else {
      yield (FinishOutOfRange(
          scoreEntered: 0, error: false, finish: activeFinish));
    }
  }

  Stream<FinishState> _mapScoreEnteredToState(ScoreEntered event) async* {
    if (activeFinish.updateScore(event.score, event.dartsNeeded)) {
      if (activeFinish.score >= 60 && activeFinish.score <= 170) {
        if (event.score > 0) {
          print('update Score');
          activeWaitWaysCubit.startTimer().then((value) {
            scoreUpdates += 1;
            activeFinish = finishes[scoreUpdates % numberOfPlayers];
            activeWaitWaysCubit =
                waitWaysCubits[scoreUpdates % numberOfPlayers];
          });
          
        }
        yield (FinishInRange(
            scoreEntered: event.score, error: false, finish: activeFinish));
      } else {
        if (activeFinish.score != 0) {
          yield (FinishOutOfRange(
              scoreEntered: event.score, finish: activeFinish, error: false));
          scoreUpdates += 1;
          activeFinish = finishes[scoreUpdates % numberOfPlayers];
          activeWaitWaysCubit = waitWaysCubits[scoreUpdates % numberOfPlayers];
        } else {
          scoreUpdates += 1;
          activeFinish = finishes[scoreUpdates % numberOfPlayers];
          activeWaitWaysCubit = waitWaysCubits[scoreUpdates % numberOfPlayers];
          print('ioefheiohfoeihfoiewhioehfohewoihoiweghoiweghowegh');
          for (Finish f in finishes) {
            print(f.score);
          }

          yield LegFinished(
              error: false, finish: activeFinish, scoreEntered: event.score);
        }
      }
    } else {
      if (activeFinish.score >= 60 && activeFinish.score <= 170) {
        yield (FinishInRange(
            scoreEntered: event.score, error: true, finish: activeFinish));
        scoreUpdates += 1;
        activeFinish = finishes[scoreUpdates % numberOfPlayers];
        activeWaitWaysCubit = waitWaysCubits[scoreUpdates % numberOfPlayers];
      } else {
        yield (FinishOutOfRange(
            scoreEntered: event.score, finish: activeFinish, error: true));
        scoreUpdates += 1;
        activeFinish = finishes[scoreUpdates % numberOfPlayers];
        activeWaitWaysCubit = waitWaysCubits[scoreUpdates % numberOfPlayers];
      }
    }
    print('fahnsdofhoaehfoie');
  }

  Stream<FinishState> _mapGameNextLegToState(GameNextLeg event) async* {
    activeFinish.nextLeg();
    if (activeFinish.score >= 60 && activeFinish.score <= 170) {
      yield (FinishInRange(
          scoreEntered: 0, error: false, finish: activeFinish));
    } else {
      yield (FinishOutOfRange(
          scoreEntered: 0, finish: activeFinish, error: false));
    }
  }

  Stream<FinishState> _mapScoreResetToState(ScoreReset event) async* {
    if (activeFinish.resetScore()) {
      yield FinishOutOfRange(
          error: false, finish: activeFinish, scoreEntered: 0);
    }
  }

  @override
  Future<void> close() {
    for (WaitWaysCubit w in waitWaysCubits) {
      w.close();
    }
    return super.close();
  }
}
