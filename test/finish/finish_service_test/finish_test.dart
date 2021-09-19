import 'dart:math';

import 'package:darts_high_finish_v2/finish/finish_service/finish.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Finish Class', () {
    test('updateScore', () {
      Finish f = Finish(
          d1: 20,
          d2: 18,
          gameMode: 3,
          setModeLegMode: false,
          legsToWinMatch: 5,
          setsToWinMatch: 3,
          legsToWinSet: 3);
      ;
      expect(f.updateScore(200, 3), false);
      f.updateScore(131, 3);
      expect(f.score, 170);
      expect(f.updateScore(180, 3), false);
    });
    test('initializeMap', () {
      Finish f = Finish(
          d1: 20,
          d2: 18,
          gameMode: 3,
          setModeLegMode: false,
          legsToWinMatch: 5,
          setsToWinMatch: 3,
          legsToWinSet: 3);
      ;
      f.updateScore(167, 3);
      expect(f.standartWay, "T20  T14  D16");
    });
    test('calculate Standart Way', () {
      Finish f = Finish(
          d1: 20,
          d2: 18,
          gameMode: 3,
          setModeLegMode: false,
          legsToWinMatch: 5,
          setsToWinMatch: 3,
          legsToWinSet: 3);
      f.updateScore(131, 3);
      expect(f.standartWay, "T20  T20  Bull");
      f.updateScore(30, 3);
      expect(f.standartWay, "T20  T16  D16");
      f.updateScore(100, 3);
      expect(f.standartWay, "");
    });
    test('calculateWaysForDouble', () {
      Finish f = Finish(
          d1: 16,
          d2: 18,
          gameMode: 3,
          setModeLegMode: false,
          legsToWinMatch: 5,
          setsToWinMatch: 3,
          legsToWinSet: 3);
      expect(f.waysD1.isEmpty, true);
      expect(f.waysD2.isEmpty, true);
      f.updateScore(167, 3);
      expect(f.waysD1.contains("T16  T18  D16"), true);
    });
    test('calculateAverage', () {
      Finish f = Finish(
          d1: 20,
          d2: 18,
          gameMode: 3,
          setModeLegMode: false,
          legsToWinMatch: 5,
          setsToWinMatch: 3,
          legsToWinSet: 3);
      ;
      f.updateScore(60, 3);
      f.updateScore(100, 3);
      expect(f.average, 80);
      expect(f.averageLeg, 80);
      expect(f.averageSet, 80);
      expect(f.averageFirstNineDarts, 80);
      expect(f.dartsNeededForLeg, 6);
      f.resetScore();
      expect(f.average, 60);
      expect(f.averageLeg, 60);
      expect(f.averageSet, 60);
      expect(f.averageFirstNineDarts, 60);
      expect(f.dartsNeededForLeg, 3);
      f.updateScore(140, 3);
      expect(f.average, 100);
      expect(f.averageLeg, 100);
      expect(f.averageSet, 100);
      expect(f.averageFirstNineDarts, 100);
      expect(f.dartsNeededForLeg, 6);
      f.updateScore(60, 3);
      expect(f.average.toInt(), 86);
      expect(f.averageLeg.toInt(), 86);
      expect(f.averageSet.toInt(), 86);
      expect(f.averageFirstNineDarts.toInt(), 86);
      expect(f.dartsNeededForLeg, 9);
      f.updateScore(30, 3);
      expect(f.average, 72.5);
      expect(f.averageLeg, 72.5);
      expect(f.averageSet, 72.5);
      expect(f.averageFirstNineDarts.toInt(), 86);
      expect(f.dartsNeededForLeg, 12);
    });

    test('reset Score', () {
      Finish f = Finish(
          d1: 20,
          d2: 18,
          gameMode: 3,
          setModeLegMode: false,
          legsToWinMatch: 5,
          setsToWinMatch: 3,
          legsToWinSet: 3);
      ;
      f.resetScore();
      expect(f.actualLeg, -1.0);
      f.updateScore(10, 3);
      f.resetScore();
      expect(f.actualLeg, -1.0);
      expect(f.actualSet, -1.0);
      f.updateScore(40, 3);
      f.updateScore(30, 3);
      f.resetScore();
      expect(f.actualLeg, 40.0);
      expect(f.actualSet, 40.0);
    });

    test('wonsets/won match', () {
      Finish f = Finish(
          d1: 20,
          d2: 18,
          gameMode: 3,
          setModeLegMode: false,
          legsToWinMatch: 100,
          setsToWinMatch: 2,
          legsToWinSet: 2);

      f.updateScore(140, 3);
      f.updateScore(120, 3);
      f.updateScore(41, 2);

      expect(f.setStatistic.legs[0].won, true);

      f.updateScore(140, 3);
      f.updateScore(120, 3);
      f.updateScore(41, 2);

      expect(f.setStatistics[0].legs[1].won, true);
      expect(f.setStatistics[0].won, true);

      f.updateScore(140, 3);
      f.updateScore(120, 3);
      f.lostLeg();
      expect(f.setStatistic.legs[0].won, false);
      expect(f.setStatistic.legs[0].legNumber, 3);

      f.updateScore(140, 3);
      f.updateScore(120, 3);
      f.updateScore(41, 2);

      expect(f.setStatistic.legs[1].won, true);

      f.updateScore(140, 3);
      f.updateScore(120, 3);
      f.lostLeg();
      f.lostSet();

      expect(f.setStatistics[1].won, false);

      f.updateScore(140, 3);
      f.updateScore(120, 3);
      f.updateScore(41, 2);

      f.updateScore(140, 3);
      f.updateScore(120, 3);
      f.updateScore(41, 2);

      expect(f.wonTheMatch, 1);
    });

    test('won legs/won match', () {
      Finish f = Finish(
          d1: 20,
          d2: 18,
          gameMode: 3,
          setModeLegMode: true,
          legsToWinMatch: 3,
          setsToWinMatch: 3,
          legsToWinSet: 3);

      f.updateScore(140, 3);
      f.updateScore(120, 3);
      f.updateScore(41, 2);

      expect(f.wonLegs, 1);

      f.updateScore(140, 3);
      f.updateScore(120, 3);
      f.updateScore(30, 2);
      f.updateScore(11, 3);

      expect(f.wonLegs, 2);
      expect(f.wonTheMatch, 0);
      expect(f.sevenToNineDartsNeeded, 1);
      expect(f.tenToTwelveDartsNeeded, 1);

      expect(f.legStatistics.last.dartsNeededForLeg, 11);
      expect(f.legStatistics.last.legAverage.toInt(), 82);
      expect(f.legStatistics.last.won, true);

      expect(f.averageWonLegs.toInt(), 97);

      f.updateScore(140, 3);
      f.updateScore(120, 3);
      f.updateScore(30, 2);
      f.lostLeg();

      expect(f.wonLegs, 2);
      expect(f.wonTheMatch, 0);

      expect(f.legStatistics.last.dartsNeededForLeg, 8);
      expect(f.legStatistics.last.legAverage.toInt(), 108);
      expect(f.legStatistics.last.won, false);
      expect(f.lastLeg.toInt(), 108);
      expect(f.wonLegAverages.last.toInt(), 82);
      expect(f.legAverages.last.toInt(), 108);

      f.updateScore(140, 3);
      f.updateScore(120, 3);
      f.updateScore(30, 2);
      f.updateScore(11, 3);

      expect(f.wonLegs, 3);
      expect(f.wonTheMatch, 1);
    });

    test('best/worst leg,sets,legs,averages', () {
      Finish f = Finish(
          d1: 20,
          d2: 18,
          gameMode: 3,
          setModeLegMode: false,
          legsToWinMatch: 5,
          setsToWinMatch: 3,
          legsToWinSet: 3);

      f.resetScore();
      expect(f.bestWonLeg, -1);
      expect(f.worstWonLeg, 190.0);
      f.updateScore(180, 3);
      f.updateScore(121, 3);
      expect(f.averageSet, 150.5);
      expect(f.bestWonLeg, 150.5);
      expect(f.worstWonLeg, 150.5);
      expect(f.legs, 2);
      f.updateScore(140, 3);
      f.updateScore(121, 3);
      f.updateScore(40, 3);
      expect(f.bestWonLeg, 150.5);
      expect(f.worstWonLeg.toInt(), 100);
      f.updateScore(100, 3);
      f.updateScore(65, 3);
      f.updateScore(45, 3);

      expect(f.averageFirstNineDarts.toInt(), 101);
      expect(f.averageScoringDarts.toInt(), 121);

      f.updateScore(91, 3);
      expect(f.bestWonLeg, 150.5);
      expect(f.worstWonLeg.toInt(), 75);
      expect(f.averageSet.toInt(), -1);
      expect(f.average.toInt(), 100);
      expect(f.sets, 2);
      expect(f.setStatistics[0].av.toInt(), 100);
      expect(f.setStatistics[0].won, true);
      expect(f.setStatistics[0].setNumber, 1);
      expect(f.legs, 4);
      expect(f.wonLegs, 3);
      expect(f.wonLegsInSet, 0);
      f.updateScore(100, 3);
      f.updateScore(65, 3);
      f.updateScore(45, 3);
      f.updateScore(61, 3);
      f.updateScore(30, 3);

      expect(f.highestScore, 180);

      expect(f.averageFirstNineDarts.toInt(), 92);

      expect(f.wonLegsInSet, 1);
      expect(f.wonLegs, 4);
      expect(f.worstWonLeg.toInt(), 60);
      expect(f.averageSet.toInt(), 60);
      expect(f.bestWonLeg, 150.5);
      f.updateScore(100, 3);
      f.updateScore(65, 3);
      f.updateScore(45, 3);
      f.updateScore(61, 3);
      f.lostLeg();
      expect(f.legAverages.last.toInt(), 67);
      expect(f.wonLegAverages.last.toInt(), 60);
      expect(f.legs, 6);

      expect(f.checkOutAverage.toInt(), 70);
      expect(f.highestCheckout, 121);
      expect(f.hundretPlusCheckout, 1);
      expect(f.fiftyToNinetyNineCheckouts, 1);
    });

    test('calculateStartScore', () {
      Finish f = Finish(
          d1: 20,
          d2: 18,
          gameMode: 3,
          setModeLegMode: false,
          legsToWinMatch: 5,
          setsToWinMatch: 3,
          legsToWinSet: 3);
      ;
      expect(f.score, 301);
    });

    test('reset Score', () {
      Finish f = Finish(
          d1: 20,
          d2: 18,
          gameMode: 3,
          setModeLegMode: false,
          legsToWinMatch: 5,
          setsToWinMatch: 3,
          legsToWinSet: 3);

      f.updateScore(100, 3);
      f.updateScore(100, 3);
      expect(f.score, 101);
      expect(f.dartsNeededForLeg, 6);
      f.resetScore();
      expect(f.score, 201);
      expect(f.dartsNeededForLeg, 3);
      f.updateScore(140, 3);
      expect(f.averageScoringDarts.toInt(), 120);
      expect(f.highestScore, 140);
      f.resetScore();
      expect(f.highestScore, 100);
      expect(f.averageScoringDarts.toInt(), 100);
      f.updateScore(140, 3);
      f.updateScore(41, 3);
      f.resetScore();
      expect(f.averageScoringDarts.toInt(), 120);
    });

    test('throwCounts', () {
      Finish f = Finish(
          d1: 20,
          d2: 18,
          gameMode: 3,
          setModeLegMode: false,
          legsToWinMatch: 5,
          setsToWinMatch: 3,
          legsToWinSet: 3);

      f.updateScore(100, 3);
      expect(f.hundretPlus, 1);

      f.updateScore(95, 3);
      expect(f.ninetyOneplus, 2);

      f.resetScore();
      expect(f.ninetyOneplus, 1);
    });
  });
}
