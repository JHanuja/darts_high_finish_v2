part of 'finish_bloc.dart';

// ignore: must_be_immutable
abstract class FinishState extends Equatable {
  final Finish finish;
  final bool error;
  final int scoreEntered;

  late int score;
  late int d1;
  late int d2;
  late String standartWay;
  late List<String> waysD1;
  late List<String> waysD2;
  late double average;
  late double averageLeg;
  late double averageSet;
  late int legs;
  late int sets;
  late int dartsNeededForLeg;
  late double averageFirstNineDarts;
  late double bestWonLeg;
  late double worstWonLeg;

  late String name;

  FinishState(this.error, this.finish, this.scoreEntered) {
    score = finish.score;
    d1 = finish.d1;
    d2 = finish.d2;
    name = finish.name;
    standartWay = finish.standartWay;
    waysD1 = finish.waysD1;
    waysD2 = finish.waysD2;
    average = finish.average;
    averageLeg = finish.averageLeg;
    averageSet = finish.averageSet;
    legs = finish.legs;
    sets = finish.sets;
    dartsNeededForLeg = finish.dartsNeededForLeg;
    averageFirstNineDarts = finish.averageFirstNineDarts;
    bestWonLeg = finish.bestWonLeg;
    worstWonLeg = finish.worstWonLeg;
  }

  @override
  List<Object> get props => [
        error,
        scoreEntered,
        score,
        d1,
        d2,
        standartWay,
        waysD1,
        waysD2,
        average,
        averageLeg,
        averageSet,
        legs,
        sets,
        dartsNeededForLeg,
        averageFirstNineDarts,
        bestWonLeg,
        worstWonLeg,
        name
      ];
}

// ignore: must_be_immutable
class FinishInitial extends FinishState {
  FinishInitial(bool error, Finish finish) : super(error, finish, 0);

  @override
  String toString() =>
      'FinishInitial{error:$error, scoreEntered: $scoreEntered, score:$score, d1: $d1, d2:$d2,standartWay: $standartWay, waysD1: $waysD1, waysD2: $waysD2, average: $average, averageLeg: $averageLeg, averageSet: $averageSet, legs: $legs, sets: $sets, dartsNeededForLeg: $dartsNeededForLeg, averageFirstNineDarts: $averageFirstNineDarts, bestWonLeg: $bestWonLeg, worstWonLeg: $worstWonLeg';

  @override
  List<Object> get props => [
        averageFirstNineDarts,
        error,
        scoreEntered,
        score,
        d1,
        d2,
        standartWay,
        waysD1,
        waysD2,
        average,
        averageLeg,
        averageSet,
        legs,
        sets,
        dartsNeededForLeg,
        bestWonLeg,
        worstWonLeg,
        name
      ];
}

// ignore: must_be_immutable
class FinishOutOfRange extends FinishState {
  FinishOutOfRange(
      {required bool error, required Finish finish, required int scoreEntered})
      : super(error, finish, scoreEntered);

  @override
  String toString() =>
      'FinishOutOfRange{error:$error, scoreEntered: $scoreEntered, score:$score, d1: $d1, d2:$d2,standartWay: $standartWay, waysD1: $waysD1, waysD2: $waysD2, average: $average, averageLeg: $averageLeg, averageSet: $averageSet, legs: $legs, sets: $sets, dartsNeededForLeg: $dartsNeededForLeg, averageFirstNineDarts: $averageFirstNineDarts, bestWonLeg: $bestWonLeg, worstWonLeg: $worstWonLeg';

  @override
  List<Object> get props => [
        averageFirstNineDarts,
        error,
        scoreEntered,
        score,
        d1,
        d2,
        standartWay,
        waysD1,
        waysD2,
        average,
        averageLeg,
        averageSet,
        legs,
        sets,
        dartsNeededForLeg,
        bestWonLeg,
        worstWonLeg,
        name
      ];
}

// ignore: must_be_immutable
class FinishInRange extends FinishState {
  FinishInRange(
      {required bool error, required Finish finish, required int scoreEntered})
      : super(error, finish, scoreEntered);

  @override
  String toString() =>
      'FinishInRange{error:$error, scoreEntered: $scoreEntered, score:$score, d1: $d1, d2:$d2,standartWay: $standartWay, waysD1: $waysD1, waysD2: $waysD2, average: $average, averageLeg: $averageLeg, averageSet: $averageSet, legs: $legs, sets: $sets, dartsNeededForLeg: $dartsNeededForLeg, averageFirstNineDarts: $averageFirstNineDarts, bestWonLeg: $bestWonLeg, worstWonLeg: $worstWonLeg';

  @override
  List<Object> get props => [
        averageFirstNineDarts,
        error,
        scoreEntered,
        score,
        d1,
        d2,
        standartWay,
        waysD1,
        waysD2,
        average,
        averageLeg,
        averageSet,
        legs,
        sets,
        dartsNeededForLeg,
        bestWonLeg,
        worstWonLeg,
        name
      ];
}

// ignore: must_be_immutable
class LegFinished extends FinishState {
  LegFinished(
      {required bool error, required Finish finish, required int scoreEntered})
      : super(error, finish, scoreEntered);

  @override
  String toString() =>
      'Leg Finished{error:$error, scoreEntered: $scoreEntered, score:$score, d1: $d1, d2:$d2,standartWay: $standartWay, waysD1: $waysD1, waysD2: $waysD2, average: $average, averageLeg: $averageLeg, averageSet: $averageSet, legs: $legs, sets: $sets, dartsNeededForLeg: $dartsNeededForLeg, averageFirstNineDarts: $averageFirstNineDarts, bestWonLeg: $bestWonLeg, worstWonLeg: $worstWonLeg';

  @override
  List<Object> get props => [
        averageFirstNineDarts,
        error,
        scoreEntered,
        score,
        d1,
        d2,
        standartWay,
        waysD1,
        waysD2,
        average,
        averageLeg,
        averageSet,
        legs,
        sets,
        dartsNeededForLeg,
        bestWonLeg,
        worstWonLeg,
        name
      ];
}
