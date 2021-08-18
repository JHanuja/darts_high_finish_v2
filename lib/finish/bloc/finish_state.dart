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
}

class FinishOutOfRange extends FinishState {
  final int score;
  const FinishOutOfRange(this.score);

  @override
  String toString() => 'FinishOutOfRange{score: $score}';
}

class FinishInRange extends FinishState {
  final String standartWay;
  final List<String> waysD1;
  final List<String> waysD2;
  final int d1;
  final int d2;
  final int score;

  const FinishInRange(
      {required this.score,
      required this.standartWay,
      required this.waysD1,
      required this.waysD2,
      required this.d1,
      required this.d2});

  @override
  String toString() => 'FinishInRange{score: $score}';
}
