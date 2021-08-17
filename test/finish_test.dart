import 'package:darts_high_finish_v2/finish.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Finish Class', () {
    test('updateScore', () {
      Finish f = Finish(d1: 20, d2: 18, score: 170);
      f.updateScore(40);
      expect(f.score, 130);
    });
    test('initializeMap', () {
      Finish f = Finish(d1: 20, d2: 18, score: 170);
      expect(f.finishes[134]?.convertToString(), "T20  T14  D16");
    });
    test('calculate Standart Way', () {
      Finish f = Finish(d1: 20, d2: 18, score: 170);
      expect(f.standartWay, "T20  T20  Bull");
      f.updateScore(30);
      expect(f.standartWay, "T20  T16  D16");
      f.updateScore(100);
      expect(f.standartWay, "");
      f.updateScore(-200);
      expect(f.standartWay, "");
    });
    test('calculateWaysForDouble', () {
      Finish f = Finish(d1: 20, d2: 20, score: 160);
      expect(f.waysD1.contains("T20  T20  D20"), true);
      expect(f.waysD2.contains("T20  T20  D20"), true);
      Finish g = Finish(d1: 16, d2: 18, score: 134);
      expect(g.waysD1.contains("T17  T17  D16"), true);
      expect(g.waysD2.contains("T20  D19  D18"), true);
    });
  });
}
