import 'package:darts_high_finish_v2/finish/finish_service/finish.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Finish Class', () {
    test('updateScore', () {
      Finish f = Finish(d1: 20, d2: 18, gameMode: 3);
      expect(f.updateScore(200, 3), false);
      f.updateScore(131, 3);
      expect(f.score, 170);
      expect(f.updateScore(180, 3), false);
    });
    test('initializeMap', () {
      Finish f = Finish(d1: 20, d2: 18, gameMode: 3);
      f.updateScore(167, 3);
      expect(f.standartWay, "T20  T14  D16");
    });
    test('calculate Standart Way', () {
      Finish f = Finish(d1: 20, d2: 18, gameMode: 3);
      f.updateScore(131, 3);
      expect(f.standartWay, "T20  T20  Bull");
      f.updateScore(30, 3);
      expect(f.standartWay, "T20  T16  D16");
      f.updateScore(100, 3);
      expect(f.standartWay, "");
    });
    test('calculateWaysForDouble', () {
      Finish f = Finish(d1: 16, d2: 18, gameMode: 3);
      expect(f.waysD1.isEmpty, true);
      expect(f.waysD2.isEmpty, true);
      f.updateScore(167, 3);
      expect(f.waysD1.contains("T16  T18  D16"), true);
    });
    test('calculateAverage', () {
      Finish f = Finish(d1: 20, d2: 18, gameMode: 3);
      f.updateScore(60, 3);
      f.updateScore(100, 3);
      expect(f.average, 80);
      expect(f.dartsNeededForLeg, 6);
      f.resetScore();
      expect(f.average, 60);
      expect(f.dartsNeededForLeg, 3);
      f.updateScore(140, 3);
      expect(f.average, 100);
      expect(f.dartsNeededForLeg, 6);
    });
    test('calculateStartScore', () {
      Finish f = Finish(d1: 20, d2: 18, gameMode: 3);
      expect(f.score, 301);
    });

    test('reset Score', () {
      Finish f = Finish(d1: 20, d2: 18, gameMode: 3);
      f.updateScore(100, 3);
      f.updateScore(100, 3);
      expect(f.score, 101);
      expect(f.dartsNeededForLeg, 6);
      f.resetScore();
      expect(f.score, 201);
      expect(f.dartsNeededForLeg, 3);
    });
  });
}
