import 'dart:math';

import 'package:darts_high_finish_v2/finish/finish_service/throw.dart';
import 'package:darts_high_finish_v2/finish/finish_service/ways.dart';

class Finish {
  final Map<int, Way> _finishes;
  late String _standartWay;
  late List<String> _waysD1;
  late List<String> _waysD2;
  int _score;
  final int _d1;
  final int _d2;
  final int _gameMode;
  final List<Throw> _thrownScores;

  int _dartsNeeded;
  double _average;
  int _thrownPoints;
  int _dartsNeededForLeg;

  static int calculateStartScore(int gameMode) {
    switch (gameMode) {
      case 1:
        if (not170()) {
          int min = 100;
          int max = 170;
          Random rnd = Random();
          int r = min + rnd.nextInt(max - min);
          return r;
        } else {
          return 170;
        }
      case 2:
        if (not170()) {
          int min = 170;
          int max = 301;
          Random rnd = Random();
          int r = min + rnd.nextInt(max - min);
          return r;
        } else {
          return 170;
        }
      case 3:
        return 301;
      case 4:
        return 501;
    }
    return 10;
  }

  static bool not170() {
    int min = 1;
    int max = 4;
    Random rnd = Random();
    int r = min + rnd.nextInt(max - min);
    if (r == 1) {
      return false;
    } else {
      return true;
    }
  }

  Finish({required d1, required d2, required int gameMode})
      : _score = calculateStartScore(gameMode),
        _average = 0.0,
        _gameMode = gameMode,
        _thrownPoints = 0,
        _d1 = d1,
        _d2 = d2,
        _dartsNeeded = 0,
        _dartsNeededForLeg = 0,
        _thrownScores = [],
        _finishes = <int, Way>{} {
    _initializeMap();
    _calculateWays();
  }

  int get score => _score;
  int get d1 => _d1;
  int get d2 => _d2;
  String get standartWay => _standartWay;
  List<String> get waysD1 => _waysD1;
  List<String> get waysD2 => _waysD2;
  double get average => _average;
  int get dartsNeededForLeg => _dartsNeededForLeg;

  bool updateScore(int score, int dartsNeeded) {
    if ((score >= 0) && (score <= 180) && (_score - score >= 0)) {
      _score -= score;
      _dartsNeeded += dartsNeeded;
      _dartsNeededForLeg += dartsNeeded;
      _thrownPoints += score;
      _thrownScores.add(Throw(score, dartsNeeded));
      _calculateWays();
      _calculateAverage();
      return true;
    } else {
      return false;
    }
  }

  bool resetScore() {
    if (_thrownScores.isNotEmpty) {
      _score += _thrownScores.last.scoredPoints;
      _thrownPoints -= _thrownScores.last.scoredPoints;
      _dartsNeededForLeg -= _thrownScores.last.dartsNeeded;
      _dartsNeeded -= _thrownScores.last.dartsNeeded;
      _thrownScores.removeLast();
      _calculateAverage();
      return true;
    } else {
      return false;
    }
  }

  void _calculateAverage() {
    _average = _dartsNeeded > 0 ? ((_thrownPoints / _dartsNeeded) * 3) : 0.0;
    return;
  }

  void resetMatch() {
    _score = calculateStartScore(_gameMode);
    _dartsNeededForLeg = 0;
    return;
  }

  void _calculateWays() {
    _standartWay = _calculateStandartWay();
    if (_standartWay != "") {
      List<List<String>> l = _calculateWaysFilteredForDouble();

      _waysD1 = (l.isNotEmpty && _score > 60) ? l.elementAt(0) : [];
      _waysD2 = (l.length == 2 && _score > 60) ? l.elementAt(1) : [];

      if (_waysD1.contains(_standartWay)) {
        _waysD1.remove(_standartWay);
      }

      if (_waysD2.contains(_standartWay)) {
        _waysD2.remove(_standartWay);
      }


    } else {
      _waysD1 = [];
      _waysD2 = [];
    }
  }

  String _calculateStandartWay() {
    return _finishes.containsKey(_score)
        ? _finishes[_score]!.convertToString()
        : "";
  }

  List<List<String>> _calculateWaysFilteredForDouble() {
    List<List<String>> results = [];
    List<Way> d1Ways = _calculateWaysForDouble(_d1, _finishes[_score]!);
    List<Way> d2Ways = _calculateWaysForDouble(_d2, _finishes[_score]!);
    List<String> resultsd1 = d1Ways.map((e) => e.convertToString()).toList();
    List<String> resultsd2 = d2Ways.map((e) => e.convertToString()).toList();

    List<int> removeIndexesD1 = [];
    List<String> redundantStringsD1 = [];
    for (int i = 0; i < resultsd1.length; i++) {
      String item = resultsd1[i];

      String a = item.substring(0, 3);
      String b = item.substring(5, 8);

      String s = b + "  " + a + "  " + "D" + d1.toString();

      if (resultsd1.contains(s) &&
          !(a == b) &&
          (!redundantStringsD1.contains(item))) {
        removeIndexesD1.add(i);
        redundantStringsD1.add(s);
      }
    }

    List<int> removeIndexesD2 = [];
    List<String> redundantStringsD2 = [];
    for (int i = 0; i < resultsd2.length; i++) {
      String item = resultsd2[i];

      String a = item.substring(0, 3);
      String b = item.substring(5, 8);

      String s = b + "  " + a + "  " + "D" + d2.toString();

      if (resultsd2.contains(s) &&
          !(a == b) &&
          (!redundantStringsD2.contains(item))) {
        removeIndexesD2.add(i);
        redundantStringsD2.add(s);
      }
    }

    for (int i = 0; i < removeIndexesD1.length; i++) {
      resultsd1.removeAt(removeIndexesD1[i] - i);
    }

    for (int i = 0; i < removeIndexesD2.length; i++) {
      resultsd2.removeAt(removeIndexesD2[i] - i);
    }

    results.add(resultsd1);
    results.add(resultsd2);
    return results;
  }

  List<Way> _calculateWaysForDouble(int num, Way standartWay) {
    List<Way> results = [];

    if (standartWay is SingleDouble) {
      for (int i = 20; i > 0; i--) {
        if ((_score - (i + num * 2)) == 0) {
          SingleDouble res = SingleDouble(prepare: i, finish: num);
          results.add(res);
        }
      }
    }

    if (standartWay is TripleDouble) {
      for (int i = 20; i > 0; i--) {
        if ((_score - (i * 3 + num * 2)) == 0) {
          TripleDouble res = TripleDouble(prepare: i, finish: num);
          results.add(res);
        }
      }
    }

    if (standartWay is SingleTripleDouble) {
      for (int i = 20; i > 0; i--) {
        for (int j = 20; j > 0; j--) {
          if ((_score - (i + j * 3 + num * 2)) == 0) {
            SingleTripleDouble res =
                SingleTripleDouble(prepare1: i, prepare2: j, finish: num);
            results.add(res);
          }
        }
      }
    }

    if (standartWay is TripleTripleDouble) {
      for (int i = 20; i > 0; i--) {
        for (int j = 20; j > 0; j--) {
          if ((_score - (i * 3 + j * 3 + num * 2)) == 0) {
            TripleTripleDouble res =
                TripleTripleDouble(prepare1: i, prepare2: j, finish: num);
            results.add(res);
          }
        }
      }
    }

    return results;
  }

  void _initializeMap() {
    _finishes[170] = TripleTripleBull(prepare1: 20, prepare2: 20);
    _finishes[169] = Bogey();
    _finishes[168] = Bogey();
    _finishes[167] = TripleTripleBull(prepare1: 20, prepare2: 19);
    _finishes[166] = Bogey();
    _finishes[165] = Bogey();
    _finishes[164] = TripleTripleBull(prepare1: 20, prepare2: 18);
    _finishes[163] = Bogey();
    _finishes[162] = Bogey();
    _finishes[161] = TripleTripleBull(prepare1: 20, prepare2: 17);
    _finishes[160] = TripleTripleDouble(prepare1: 20, prepare2: 20, finish: 20);
    _finishes[159] = Bogey();
    _finishes[158] = TripleTripleDouble(prepare1: 20, prepare2: 20, finish: 19);
    _finishes[157] = TripleTripleDouble(prepare1: 20, prepare2: 19, finish: 20);
    _finishes[156] = TripleTripleDouble(prepare1: 20, prepare2: 20, finish: 18);
    _finishes[155] = TripleTripleDouble(prepare1: 20, prepare2: 19, finish: 19);
    _finishes[154] = TripleTripleDouble(prepare1: 20, prepare2: 18, finish: 20);
    _finishes[153] = TripleTripleDouble(prepare1: 20, prepare2: 19, finish: 18);
    _finishes[152] = TripleTripleDouble(prepare1: 20, prepare2: 20, finish: 16);
    _finishes[151] = TripleTripleDouble(prepare1: 20, prepare2: 17, finish: 20);
    _finishes[150] = TripleTripleDouble(prepare1: 20, prepare2: 18, finish: 18);
    _finishes[149] = TripleTripleDouble(prepare1: 20, prepare2: 19, finish: 16);
    _finishes[148] = TripleTripleDouble(prepare1: 20, prepare2: 19, finish: 19);
    _finishes[147] = TripleTripleDouble(prepare1: 20, prepare2: 17, finish: 18);
    _finishes[146] = TripleTripleDouble(prepare1: 20, prepare2: 18, finish: 16);
    _finishes[145] = TripleTripleDouble(prepare1: 20, prepare2: 15, finish: 20);
    _finishes[144] = TripleTripleDouble(prepare1: 20, prepare2: 20, finish: 12);
    _finishes[143] = TripleTripleDouble(prepare1: 20, prepare2: 17, finish: 16);
    _finishes[142] = TripleTripleDouble(prepare1: 20, prepare2: 14, finish: 20);
    _finishes[141] = TripleTripleDouble(prepare1: 20, prepare2: 19, finish: 12);
    _finishes[140] = TripleTripleDouble(prepare1: 20, prepare2: 16, finish: 16);
    _finishes[139] = TripleTripleDouble(prepare1: 19, prepare2: 14, finish: 20);
    _finishes[138] = TripleTripleDouble(prepare1: 20, prepare2: 18, finish: 12);
    _finishes[137] = TripleTripleDouble(prepare1: 19, prepare2: 16, finish: 16);
    _finishes[136] = TripleTripleDouble(prepare1: 20, prepare2: 20, finish: 8);
    _finishes[135] = TripleTripleDouble(prepare1: 20, prepare2: 17, finish: 12);
    _finishes[134] = TripleTripleDouble(prepare1: 20, prepare2: 14, finish: 16);
    _finishes[133] = TripleTripleDouble(prepare1: 20, prepare2: 19, finish: 8);
    _finishes[132] = TripleTripleDouble(prepare1: 20, prepare2: 16, finish: 12);
    _finishes[131] = TripleTripleDouble(prepare1: 20, prepare2: 13, finish: 16);
    _finishes[130] = TripleTripleDouble(prepare1: 20, prepare2: 20, finish: 5);
    _finishes[129] = TripleTripleDouble(prepare1: 19, prepare2: 16, finish: 12);
    _finishes[128] = TripleTripleDouble(prepare1: 18, prepare2: 14, finish: 16);
    _finishes[127] = TripleTripleDouble(prepare1: 20, prepare2: 17, finish: 8);
    _finishes[126] = TripleTripleDouble(prepare1: 19, prepare2: 19, finish: 6);
    _finishes[125] = SingleTripleDouble(prepare1: 25, prepare2: 20, finish: 20);
    _finishes[124] = TripleTripleDouble(prepare1: 20, prepare2: 16, finish: 8);
    _finishes[123] = TripleTripleDouble(prepare1: 19, prepare2: 16, finish: 9);
    _finishes[122] = TripleTripleDouble(prepare1: 18, prepare2: 20, finish: 4);
    _finishes[121] = TripleTripleDouble(prepare1: 17, prepare2: 10, finish: 20);
    _finishes[120] = SingleTripleDouble(prepare1: 20, prepare2: 20, finish: 20);
    _finishes[119] = TripleTripleDouble(prepare1: 19, prepare2: 10, finish: 16);
    _finishes[118] = SingleTripleDouble(prepare1: 18, prepare2: 20, finish: 20);
    _finishes[117] = SingleTripleDouble(prepare1: 17, prepare2: 20, finish: 20);
    _finishes[116] = SingleTripleDouble(prepare1: 16, prepare2: 20, finish: 20);
    _finishes[115] = SingleTripleDouble(prepare1: 15, prepare2: 20, finish: 20);
    _finishes[114] = SingleTripleDouble(prepare1: 14, prepare2: 20, finish: 20);
    _finishes[113] = SingleTripleDouble(prepare1: 13, prepare2: 20, finish: 20);
    _finishes[112] = SingleTripleDouble(prepare1: 12, prepare2: 20, finish: 20);
    _finishes[111] = SingleTripleDouble(prepare1: 19, prepare2: 20, finish: 16);
    _finishes[110] = SingleTripleDouble(prepare1: 18, prepare2: 20, finish: 16);
    _finishes[109] = SingleTripleDouble(prepare1: 20, prepare2: 19, finish: 16);
    _finishes[108] = SingleTripleDouble(prepare1: 16, prepare2: 20, finish: 16);
    _finishes[107] = SingleTripleDouble(prepare1: 18, prepare2: 19, finish: 16);
    _finishes[106] = SingleTripleDouble(prepare1: 14, prepare2: 20, finish: 16);
    _finishes[105] = SingleTripleDouble(prepare1: 16, prepare2: 19, finish: 16);
    _finishes[104] = SingleTripleDouble(prepare1: 18, prepare2: 18, finish: 16);
    _finishes[103] = SingleTripleDouble(prepare1: 3, prepare2: 20, finish: 20);
    _finishes[102] = SingleTripleDouble(prepare1: 10, prepare2: 20, finish: 16);
    _finishes[101] = SingleTripleDouble(prepare1: 1, prepare2: 20, finish: 20);
    _finishes[100] = TripleDouble(prepare: 20, finish: 20);
    _finishes[99] = SingleTripleDouble(prepare1: 10, prepare2: 19, finish: 16);
    _finishes[98] = TripleDouble(prepare: 20, finish: 19);
    _finishes[97] = TripleDouble(prepare: 19, finish: 20);
    _finishes[96] = TripleDouble(prepare: 20, finish: 18);
    _finishes[95] = TripleDouble(prepare: 19, finish: 19);
    _finishes[94] = TripleDouble(prepare: 18, finish: 20);
    _finishes[93] = TripleDouble(prepare: 19, finish: 18);
    _finishes[92] = TripleDouble(prepare: 20, finish: 16);
    _finishes[91] = TripleDouble(prepare: 17, finish: 20);
    _finishes[90] = TripleDouble(prepare: 20, finish: 15);
    _finishes[89] = TripleDouble(prepare: 19, finish: 16);
    _finishes[88] = TripleDouble(prepare: 16, finish: 20);
    _finishes[87] = TripleDouble(prepare: 17, finish: 18);
    _finishes[86] = TripleDouble(prepare: 18, finish: 16);
    _finishes[85] = TripleDouble(prepare: 15, finish: 20);
    _finishes[84] = TripleDouble(prepare: 20, finish: 12);
    _finishes[83] = TripleDouble(prepare: 17, finish: 16);
    _finishes[82] = TripleDouble(prepare: 14, finish: 20);
    _finishes[81] = TripleDouble(prepare: 19, finish: 12);
    _finishes[80] = TripleDouble(prepare: 20, finish: 10);
    _finishes[79] = TripleDouble(prepare: 19, finish: 11);
    _finishes[78] = TripleDouble(prepare: 18, finish: 12);
    _finishes[77] = TripleDouble(prepare: 19, finish: 10);
    _finishes[76] = TripleDouble(prepare: 20, finish: 8);
    _finishes[75] = TripleDouble(prepare: 17, finish: 12);
    _finishes[74] = TripleDouble(prepare: 14, finish: 16);
    _finishes[73] = TripleDouble(prepare: 19, finish: 8);
    _finishes[72] = TripleDouble(prepare: 16, finish: 12);
    _finishes[71] = TripleDouble(prepare: 13, finish: 16);
    _finishes[70] = TripleDouble(prepare: 10, finish: 20);
    _finishes[69] = TripleDouble(prepare: 15, finish: 12);
    _finishes[68] = TripleDouble(prepare: 20, finish: 4);
    _finishes[67] = TripleDouble(prepare: 17, finish: 8);
    _finishes[66] = TripleDouble(prepare: 10, finish: 18);
    _finishes[65] = TripleDouble(prepare: 19, finish: 4);
    _finishes[64] = TripleDouble(prepare: 16, finish: 8);
    _finishes[63] = TripleDouble(prepare: 13, finish: 12);
    _finishes[62] = TripleDouble(prepare: 10, finish: 16);
    _finishes[61] = TripleDouble(prepare: 15, finish: 8);
  }
}
