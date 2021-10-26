import 'package:darts_high_finish_v2/finish/finish_service/leg_statistic.dart';

class SetStatistic {
  final int setNumber;
  late bool won;
  late double av;

  final List<LegStatistic> legs;

  SetStatistic({required this.setNumber}) : legs = [];

  void setAverage(double average) {
    av = average;
  }

  void setWon(bool won) {
    won = won;
  }

  void setLeg(LegStatistic leg) {
    legs.add(leg);
  }
}
