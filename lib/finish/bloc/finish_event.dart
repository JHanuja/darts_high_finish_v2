part of 'finish_bloc.dart';

abstract class FinishEvent extends Equatable {
  const FinishEvent();

  @override
  List<Object> get props => [];
}

class ScoreEntered extends FinishEvent {
  final int score;
  final int dartsNeeded;
  const ScoreEntered({required this.score, required this.dartsNeeded});
}

class ScoreReset extends FinishEvent {
  const ScoreReset();
}

class GameStarted extends FinishEvent {
  const GameStarted();
}

class GameReset extends FinishEvent {
  const GameReset();
}
