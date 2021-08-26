part of 'finish_bloc.dart';

abstract class FinishState extends Equatable {
  final int score;
  final double average;
  final int dartsNeeded;
  final bool error;
  final int scoreEntered;
  const FinishState(this.score, this.average, this.dartsNeeded, this.error,this.scoreEntered);

  @override
  List<Object> get props => [score, average, dartsNeeded, error,scoreEntered];
}

class FinishInitial extends FinishState {
  const FinishInitial() : super(0, 0.0, 0, false,0);
  @override
  String toString() => 'FinishInitial';

  @override
  List<Object> get props => [];
}

class FinishOutOfRange extends FinishState {
  const FinishOutOfRange(
      {required int score,
      required bool error,
      required double average,
      required int dartsNeeded,
      required int scoreEntered})
      : super(score, average, dartsNeeded, error,scoreEntered);

  @override
  String toString() => 'FinishOutOfRange{score: $score, error: $error, average: $average, dartsNeeded: $dartsNeeded, scoreEntered: $scoreEntered}';

  @override
  List<Object> get props => [score, error, average, dartsNeeded,scoreEntered];
}

class FinishInRange extends FinishState {
  final String standartWay;
  final List<String> waysD1;
  final List<String> waysD2;
  final int d1;
  final int d2;

  const FinishInRange(
      {required int score,
      required double average,
      required int dartsNeeded,
      required this.standartWay,
      required this.waysD1,
      required this.waysD2,
      required this.d1,
      required this.d2,
      required bool error,
      required int scoreEntered})
      : super(score, average, dartsNeeded, error,scoreEntered);

  @override
  List<Object> get props =>
      [score, average, dartsNeeded, standartWay, waysD1, waysD2, d1, d2, error,scoreEntered];

  @override
  String toString() => 'FinishInRange{score: $score, wait: $error, average: $average, dartsNeeded: $dartsNeeded, standartWay: $standartWay, waysD1: $waysD1, waysD2: $waysD1, d1: $d1, d2: $d2, scoreEntered: $scoreEntered}';
}
