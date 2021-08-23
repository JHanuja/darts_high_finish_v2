part of 'finish_bloc.dart';

abstract class FinishState extends Equatable {
  const FinishState();

  @override
  List<Object> get props => [];
}

class FinishInitial extends FinishState {
  const FinishInitial();
  @override
  String toString() => 'FinishInitial';

  @override
  List<Object> get props => [];
}

class FinishOutOfRange extends FinishState {
  final int score;
  final bool error;
  const FinishOutOfRange({required this.score, required this.error});

  @override
  String toString() => 'FinishOutOfRange{score: $score, error: $error}';

  @override
  List<Object> get props => [score, error];
}

class FinishInRange extends FinishState {
  final String standartWay;
  final List<String> waysD1;
  final List<String> waysD2;
  final int d1;
  final int d2;
  final int score;
  final bool error;

  const FinishInRange(
      {required this.score,
      required this.standartWay,
      required this.waysD1,
      required this.waysD2,
      required this.d1,
      required this.d2,
      required this.error});

  @override
  List<Object> get props => [standartWay, waysD1, waysD2, d1, d2, score, error];

  @override
  String toString() => 'FinishInRange{score: $score, wait: $error}';
}
