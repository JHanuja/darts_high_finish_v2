import 'dart:math';
import 'package:darts_high_finish_v2/finish/finish_service/leg_statistic.dart';
import 'package:darts_high_finish_v2/finish/finish_service/set_statistic.dart';
import 'package:darts_high_finish_v2/finish/finish_service/throw.dart';
import 'package:darts_high_finish_v2/finish/finish_service/ways.dart';
import 'package:darts_high_finish_v2/finish/view/finish_view.dart';
import 'package:darts_high_finish_v2/x01GameProperties/view/x01_game_properties.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Finish extends Equatable {
  final Map<int, Way> _finishes;
  late String _standartWay;
  late List<String> _waysD1;
  late List<String> _waysD2;
  int _score;
  final int _d1;
  final int _d2;
  final String _gameMode;
  final List<Throw> _thrownScores;
  final String _name;

  final bool _setModeLegMode;
  final int _legsToWinSet;
  final int _setsToWinMatch;
  final int _legsToWinMatch;

  int _dartsNeeded;
  double _average;
  int _thrownPoints;

  final List<double> _setAverages;
  final List<double> _wonSetAverages;

  double _averageSet;
  int _thrownPointsSet;
  int _dartsNeededForSet;

  final List<double> _legAverages;
  final List<double> _wonLegAverages;
  double _averageWonLegs;

  double _averageLeg;
  int _thrownPointsLeg;
  int _dartsNeededForLeg;

  int _legs;
  int _sets;

  final List<int> _firstNineDartsPoints;
  double _averageFirstNineDarts;

  double _averageScoringDarts;
  int _thrownPointsScoringDarts;
  int _dartsNeededScoringDarts;

  double _bestWonLeg;
  double _worstWonLeg;

  int _wonLegs;
  int _wonSets;

  int _wonLegsInSet;

  int _highestScore;
  final List<int> _checkouts;
  int _highestCheckout;
  double _checkOutAverage;
  int _fiftyToNinetyNineCheckouts;
  int _hundretPlusCheckouts;

  final List<SetStatistic> _setStatistics;
  final List<LegStatistic> _legStatistics;

  SetStatistic _setStatistic;

  late List<Finish> opponents;
  int _wonMatch;

  int _51plus;
  int _71plus;
  int _91plus;
  int _131plus;
  int _171plus;
  int _60plus;
  int _80plus;
  int _100plus;
  int _140plus;
  int _180s;

  int _nineDartsNeeded;
  int _tenToTwelveDartsNeeded;
  int _thirtheenToFifteenDartsNeeded;
  int _sixteenToEighteenDartsNeeded;
  int _nineteenToTwentyOneDartsNeeded;
  int _twentyTwoToTwentyFourDartsNeeded;
  int _twentyFiveToTwentySevenDartsNeeded;
  int _twentyEightToThirtyDartsNeeded;
  int _thirtyOnePlusDartsNeeded;

  StartScoreObject _startScoreObject;

  int gameModeIs501;

  Finish({
    required d1,
    required d2,
    required int score,
    required String gameMode,
    required String name,
    required bool setModeLegMode,
    required int legsToWinSet,
    required int setsToWinMatch,
    required int legsToWinMatch,
    required StartScoreObject startScoreObject,
  })  : _score = score,
        gameModeIs501 = (score == 501) ? 1 : 0,
        _startScoreObject = startScoreObject,
        _setModeLegMode = setModeLegMode,
        _legsToWinSet = legsToWinSet,
        _name = name,
        _setsToWinMatch = setsToWinMatch,
        _legsToWinMatch = legsToWinMatch,
        _averageWonLegs = -1.0,
        _thrownPointsScoringDarts = 0,
        _dartsNeededScoringDarts = 0,
        _51plus = 0,
        _nineDartsNeeded = 0,
        _tenToTwelveDartsNeeded = 0,
        _thirtheenToFifteenDartsNeeded = 0,
        _sixteenToEighteenDartsNeeded = 0,
        _nineteenToTwentyOneDartsNeeded = 0,
        _twentyTwoToTwentyFourDartsNeeded = 0,
        _twentyFiveToTwentySevenDartsNeeded = 0,
        _twentyEightToThirtyDartsNeeded = 0,
        _thirtyOnePlusDartsNeeded = 0,
        _71plus = 0,
        _91plus = 0,
        _131plus = 0,
        _171plus = 0,
        _60plus = 0,
        _80plus = 0,
        _100plus = 0,
        _140plus = 0,
        _180s = 0,
        _fiftyToNinetyNineCheckouts = 0,
        _hundretPlusCheckouts = 0,
        _averageScoringDarts = -1.0,
        _highestCheckout = -1,
        _checkOutAverage = -1.0,
        _checkouts = [],
        _wonLegs = 0,
        _wonSets = 0,
        _highestScore = -1,
        _wonLegsInSet = 0,
        _average = -1.0,
        _averageLeg = -1.0,
        _averageSet = -1.0,
        _bestWonLeg = -1.0,
        _wonMatch = 0,
        _setStatistics = [],
        _legStatistics = [],
        _setStatistic = SetStatistic(setNumber: 1),
        _worstWonLeg = 190.0,
        _averageFirstNineDarts = -1.0,
        _firstNineDartsPoints = [],
        _gameMode = gameMode,
        _legAverages = [],
        _setAverages = [],
        _wonLegAverages = [],
        _wonSetAverages = [],
        _legs = 1,
        _sets = 1,
        _thrownPoints = 0,
        _thrownPointsLeg = 0,
        _thrownPointsSet = 0,
        _d1 = d1,
        _d2 = d2,
        _dartsNeeded = 0,
        _dartsNeededForLeg = 0,
        _dartsNeededForSet = 0,
        _thrownScores = [],
        _finishes = <int, Way>{} {
    _initializeMap();
    _calculateWays();

    opponents = [];
  }

  int get score => _score;
  int get d1 => _d1;
  int get d2 => _d2;
  String get standartWay => _standartWay;
  List<String> get waysD1 => _waysD1;
  List<String> get waysD2 => _waysD2;
  double get average => _average;
  double get averageLeg => _averageLeg;
  double get averageSet => _averageSet;
  int get legs => _legs;
  int get sets => _sets;

  int get dartsNeededForLeg => _dartsNeededForLeg;
  double get averageFirstNineDarts => _averageFirstNineDarts;

  double get bestWonLeg => _bestWonLeg;
  double get worstWonLeg => _worstWonLeg;

  int get wonLegs => _wonLegs;
  int get wonSets => _wonSets;

  String get gameMode => _gameMode;

  int get wonLegsInSet => _wonLegsInSet;
  List<SetStatistic> get setStatistics => _setStatistics;
  List<LegStatistic> get legStatistics => _legStatistics;

  SetStatistic get setStatistic => _setStatistic;

  List<double> get legAverages => _legAverages;
  List<double> get wonLegAverages => _wonLegAverages;
  double get averageWonLegs => _averageWonLegs;
  double get averageScoringDarts => _averageScoringDarts;

  double get lastLeg => _legAverages.isEmpty ? -1.0 : _legAverages.last;
  double get actualLeg => _averageLeg;
  double get actualSet => _averageSet;

  int get highestScore => _highestScore;
  int get highestCheckout => _highestCheckout;
  double get checkOutAverage => _checkOutAverage;
  int get fiftyToNinetyNineCheckouts => _fiftyToNinetyNineCheckouts;
  int get hundretPlusCheckout => _hundretPlusCheckouts;

  int get throwCount => _thrownScores.length;
  int get fiftyOneplus => _51plus;
  int get seventyOneplus => _71plus;
  int get ninetyOneplus => _91plus;
  int get hundretThirtyOneplus => _131plus;
  int get hundretSeventyOneplus => _171plus;
  int get sixtyPlus => _60plus;
  int get eightyPlus => _80plus;
  int get hundretPlus => _100plus;
  int get hundretFortyPlus => _140plus;
  int get hundretEighty => _180s;

  int get nineDartsNeeded => _nineDartsNeeded;
  int get tenToTwelveDartsNeeded => _tenToTwelveDartsNeeded;
  int get thirtheenToFifteenDartsNeeded => _thirtheenToFifteenDartsNeeded;
  int get sixteenToEighteenDartsNeeded => _sixteenToEighteenDartsNeeded;
  int get nineteenToTwentyOneDartsNeeded => _nineteenToTwentyOneDartsNeeded;
  int get twentyTwoToTwentyFourDartsNeeded => _twentyTwoToTwentyFourDartsNeeded;
  int get twentyFiveToTwentySevenDartsNeeded =>
      _twentyFiveToTwentySevenDartsNeeded;

  int get twentyEightToThirtyDartsNeeded => _twentyEightToThirtyDartsNeeded;
  int get thirtyOnePlusDartsNeeded => _thirtyOnePlusDartsNeeded;

  int get wonTheMatch => _wonMatch;
  String get name => _name;

  bool get setModeLegMode => _setModeLegMode;

  late List<Finish> otherFinishes;

  @override
  List<Object?> get props => [
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
        wonLegsInSet,
        wonSets,
        wonLegs,
        legAverages,
        wonLegAverages,
        lastLeg,
        actualLeg,
        actualSet
      ];

  void setOtherFinishes(List<Finish> f) {
    otherFinishes = f;
    print('-------' + name);
    for (Finish f in otherFinishes) {
      print(f.name);
    }
  }

  void setWorstWonLeg() {
    double min = 190.0;
    for (double l in _wonLegAverages) {
      if (l < min) {
        min = l;
      }
    }
    _worstWonLeg = min;
  }

  void setBestWonLeg() {
    double max = -1.0;
    for (double l in _wonLegAverages) {
      if (l > max) {
        max = l;
      }
    }
    _bestWonLeg = max;
  }

  bool updateScore(int score, int dartsNeeded) {
    if ((score >= 0) && (score <= 180) && (_score - score >= 0)) {
      //putScoresInTable(score);

      if (_score > 170) {
        _thrownPointsScoringDarts += score;
        _dartsNeededScoringDarts += dartsNeeded;
      }

      if (_score - score == 0) {
        _checkouts.add(score);
        _highestCheckout = _checkouts.isNotEmpty ? _checkouts.fold(0, max) : -1;
        _checkOutAverage = _checkouts.isNotEmpty
            ? (_checkouts.fold(
                    0,
                    (previousValue, element) =>
                        (previousValue as int) + element)) /
                _checkouts.length
            : -1.0;

        if (score >= 100) {
          _hundretPlusCheckouts += 1;
        } else {
          if (score >= 50) {
            _fiftyToNinetyNineCheckouts += 1;
          }
        }
      }

      _score -= score;
      _dartsNeeded += dartsNeeded;
      _dartsNeededForLeg += dartsNeeded;
      _dartsNeededForSet += dartsNeeded;
      _thrownPoints += score;
      _thrownPointsLeg += score;
      _thrownPointsSet += score;
      _thrownScores.add(Throw(score, dartsNeeded));

      if (_dartsNeededForLeg <= 9) {
        _firstNineDartsPoints.add(score);
      }

      _calculateWays();
      _calculateAverage();
      _calculateHighestScore();
      _calculateThrowCounts();

      if (_score == 0) {
        wonLeg();
        for (Finish opponent in opponents) {
          opponent.lostLeg();
        }
      }
      return true;
    } else {
      return false;
    }
  }

  void _calculateThrowCounts() {
    _180s = 0;
    _171plus = 0;
    _140plus = 0;
    _131plus = 0;
    _100plus = 0;
    _91plus = 0;
    _80plus = 0;
    _71plus = 0;
    _51plus = 0;
    _60plus = 0;

    for (Throw t in _thrownScores) {
      int val = t.scoredPoints;

      if (val == 180) {
        _180s += 1;
      }

      if (val >= 171) {
        _171plus += 1;
      }

      if (val >= 140 && val < 180) {
        _140plus += 1;
      }

      if (val >= 131 && val < 171) {
        _131plus += 1;
      }

      if (val >= 100 && val < 140) {
        _100plus += 1;
      }

      if (val >= 91 && val < 131) {
        _91plus += 1;
      }

      if (val >= 80 && val < 100) {
        _80plus += 1;
      }

      if (val >= 71 && val < 91) {
        _71plus += 1;
      }

      if (val >= 60 && val < 80) {
        _60plus += 1;
      }

      if (val >= 51 && val < 71) {
        _51plus += 1;
      }
    }
  }

  void _calculateHighestScore() {
    int max = 0;
    for (Throw t in _thrownScores) {
      if (t.scoredPoints > max) {
        max = t.scoredPoints;
      }
    }
    _highestScore = max;
  }

  void wonLeg() {
    LegStatistic legStatistic = LegStatistic(
        dartsNeededForLeg: _dartsNeededForLeg,
        checkout: _checkouts.last,
        won: true,
        legNumber: _legs,
        legAverage: _averageLeg);
    _calculateDartsNeededForLeg();

    _legStatistics.add(legStatistic);
    _setStatistic.setLeg(legStatistic);
    _wonLegAverages.add(_averageLeg);

    _wonLegs += 1;
    _wonLegsInSet += 1;
    setBestWonLeg();
    setWorstWonLeg();
    _averageWonLegs = _calculateWonLegAverage();

    _startScoreObject.calculateScore();

    for (Finish f in otherFinishes) {
      print('------------' + f.name);
      f.lostLeg();
    }

    if (_setModeLegMode) {
      if (_wonLegs == _legsToWinMatch) {
        wonMatch();
        for (Finish opponent in opponents) {
          opponent.lostMatch();
        }
      } else {
        nextLeg();
      }
    } else {
      if (_wonLegsInSet == _legsToWinSet) {
        wonSet();
        for (Finish opponent in opponents) {
          opponent.lostSet();
        }
      } else {
        nextLeg();
      }
    }
  }

  void lostLeg() {
    LegStatistic legStatistic = LegStatistic(
        legNumber: _legs,
        dartsNeededForLeg: _dartsNeededForLeg,
        checkout: -1,
        won: false,
        legAverage: _averageLeg);
    _legStatistics.add(legStatistic);
    _setStatistic.setLeg(legStatistic);
    nextLeg();
  }

  void wonSet() {
    _wonSetAverages.add(_averageSet);
    _setStatistic.av = _averageSet;
    _setStatistic.won = true;
    _setStatistics.add(_setStatistic);
    _wonSets += 1;
    if (_wonSets == _setsToWinMatch) {
      wonMatch();
      for (Finish opponent in opponents) {
        opponent.lostMatch();
      }
    } else {
      nextLeg();
      nextSet();
    }
  }

  void lostSet() {
    _setStatistic.av = _averageSet;
    _setStatistic.won = false;
    _setStatistics.add(_setStatistic);
    nextSet();
  }

  void nextLeg() {
    _legAverages.add(_averageLeg);
    _averageLeg = -1.0;
    _thrownPointsLeg = 0;
    _dartsNeededForLeg = 0;
    _legs += 1;
    _score = _startScoreObject.score;
  }

  void nextSet() {
    _setAverages.add(_averageSet);
    _averageSet = -1.0;
    _thrownPointsSet = 0;
    _dartsNeededForSet = 0;
    _wonLegsInSet = 0;
    _sets += 1;
    _setStatistic = SetStatistic(setNumber: _sets);
  }

  void wonMatch() {
    _wonMatch = 1;
    for (Finish opponent in opponents) {
      opponent.lostMatch();
    }
  }

  void lostMatch() {
    _wonMatch = 2;
  }

  bool resetScore() {
    if (_thrownScores.isNotEmpty && (_dartsNeededForLeg != 0)) {
      if (_dartsNeededForLeg <= 9) {
        _firstNineDartsPoints.removeLast();
      }
      _score += _thrownScores.last.scoredPoints;
      _thrownPoints -= _thrownScores.last.scoredPoints;
      _dartsNeededForLeg -= _thrownScores.last.dartsNeeded;
      _thrownPointsLeg -= _thrownScores.last.scoredPoints;
      _dartsNeededForSet -= _thrownScores.last.dartsNeeded;
      _thrownPointsSet -= _thrownScores.last.scoredPoints;
      _dartsNeeded -= _thrownScores.last.dartsNeeded;

      if (_score > 170) {
        _thrownPointsScoringDarts -= _thrownScores.last.scoredPoints;
        _dartsNeededScoringDarts -= _thrownScores.last.dartsNeeded;
      }

      _thrownScores.removeLast();
      _calculateAverage();
      _calculateHighestScore();
      _calculateThrowCounts();
      return true;
    } else {
      return false;
    }
  }

  void _calculateDartsNeededForLeg() {
    if (_dartsNeededForLeg == 9) {
      _nineDartsNeeded += 1;
    } else if (_dartsNeededForLeg > 9 && _dartsNeededForLeg <= 12) {
      _tenToTwelveDartsNeeded += 1;
    } else if (_dartsNeededForLeg > 12 && _dartsNeededForLeg <= 15) {
      _thirtheenToFifteenDartsNeeded += 1;
    } else if (_dartsNeededForLeg > 15 && _dartsNeededForLeg <= 18) {
      _sixteenToEighteenDartsNeeded += 1;
    } else if (_dartsNeededForLeg > 18 && _dartsNeededForLeg <= 21) {
      _nineteenToTwentyOneDartsNeeded += 1;
    } else if (_dartsNeededForLeg > 21 && _dartsNeededForLeg <= 24) {
      _twentyTwoToTwentyFourDartsNeeded += 1;
    } else if (_dartsNeededForLeg > 24 && _dartsNeededForLeg <= 27) {
      _twentyFiveToTwentySevenDartsNeeded += 1;
    } else if (_dartsNeededForLeg > 27 && _dartsNeededForLeg <= 30) {
      _twentyEightToThirtyDartsNeeded += 1;
    } else if (_dartsNeededForLeg > 30) {
      _thirtyOnePlusDartsNeeded += 1;
    }
  }

  double _calculateWonLegAverage() {
    double result = 0.0;
    for (double av in _wonLegAverages) {
      result += av;
    }
    return result / _wonLegAverages.length;
  }

  void _calculateAverage() {
    _average = _dartsNeeded > 0 ? ((_thrownPoints / _dartsNeeded) * 3) : 0.0;
    _averageLeg = _dartsNeededForLeg > 0
        ? ((_thrownPointsLeg / _dartsNeededForLeg) * 3)
        : -1.0;
    _averageSet = _dartsNeededForSet > 0
        ? ((_thrownPointsSet / _dartsNeededForSet) * 3)
        : -1.0;
    _averageFirstNineDarts = _calculateAverageFirstNineDarts();

    _averageScoringDarts = _dartsNeededScoringDarts > 0
        ? ((_thrownPointsScoringDarts / _dartsNeededScoringDarts) * 3)
        : -1.0;

    return;
  }

  double _calculateAverageFirstNineDarts() {
    int scores = 0;
    for (int i in _firstNineDartsPoints) {
      scores += i;
    }
    return scores / _firstNineDartsPoints.length;
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

    /*

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

    */

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

  /*
  Finish.createForTest(
      {required int score,
      required double average,
      required double averageLeg,
      required double averageSet,
      required int wonLegs,
      required List<SetStatistic> setStatistics,
      required int wonSets,
      required int gameMode,
      required int wonLegsInSet,
      required double averageFirstNineDarts,
      required List<int> firstNineDartsPoints,
      required List<double> legAverages,
      required List<double> setAverages,
      required List<double> wonLegAverages,
      required List<double> wonSetAverages,
      required int legs,
      required int sets,
      required int thrownPoints,
      required int thrownPointsLeg,
      required int thrownPointsSet,
      required int d1,
      required int d2,
      required int dartsNeeded,
      required int dartsNeededForLeg,
      required int dartsNeededForSet,
      required List<Throw> thrownScores,
      required double worstWonLeg,
      required double bestWonLeg})
      : _score = score,
        _average = average,
        _wonLegs = wonLegs,
        _wonSets = wonSets,
        _wonLegsInSet = wonLegsInSet,
        _averageLeg = averageLeg,
        _averageSet = averageSet,
        _bestWonLeg = bestWonLeg,
        _worstWonLeg = worstWonLeg,
        _setStatistics = setStatistics,
        _firstNineDartsPoints = firstNineDartsPoints,
        _averageFirstNineDarts = averageFirstNineDarts,
        _gameMode = gameMode,
        _legAverages = legAverages,
        _setAverages = setAverages,
        _wonLegAverages = wonLegAverages,
        _wonSetAverages = wonSetAverages,
        _legs = legs,
        _sets = sets,
        _thrownPoints = thrownPoints,
        _thrownPointsLeg = thrownPointsLeg,
        _thrownPointsSet = thrownPointsSet,
        _d1 = d1,
        _d2 = d2,
        _dartsNeeded = dartsNeeded,
        _dartsNeededForLeg = dartsNeededForLeg,
        _dartsNeededForSet = dartsNeededForSet,
        _thrownScores = thrownScores,
        _finishes = <int, Way>{} {
    _initializeMap();
    _calculateWays();
  }

  Finish copyWith(
      {int? score,
      double? average,
      double? averageLeg,
      double? averageSet,
      int? gameMode,
      int? wonLegs,
      int? wonSets,
      int? wonLegsInSet,
      List<double>? legAverages,
      List<double>? setAverages,
      List<double>? wonLegAverages,
      List<double>? wonSetAverages,
      List<SetStatistic>? setStatistics,
      int? legs,
      int? sets,
      int? thrownPoints,
      int? thrownPointsLeg,
      int? thrownPointsSet,
      int? d1,
      int? d2,
      int? dartsNeeded,
      int? dartsNeededForLeg,
      int? dartsNeededForSet,
      double? averageFirstNineDarts,
      List<int>? firstNineDartsPoints,
      List<Throw>? thrownScores,
      double? bestWonLeg,
      double? worstWonLeg}) {
    return Finish.createForTest(
        wonLegs: wonLegs ?? _wonLegs,
        wonSets: wonSets ?? _wonSets,
        bestWonLeg: bestWonLeg ?? _bestWonLeg,
        wonLegsInSet: wonLegsInSet ?? _wonLegsInSet,
        worstWonLeg: worstWonLeg ?? _worstWonLeg,
        score: score ?? _score,
        average: average ?? _average,
        setStatistics: setStatistics ?? _setStatistics,
        firstNineDartsPoints: firstNineDartsPoints ?? _firstNineDartsPoints,
        averageLeg: averageLeg ?? _averageLeg,
        averageFirstNineDarts: averageFirstNineDarts ?? _averageFirstNineDarts,
        averageSet: averageSet ?? _averageSet,
        gameMode: gameMode ?? _gameMode,
        legAverages: legAverages ?? _legAverages,
        setAverages: setAverages ?? _setAverages,
        wonLegAverages: wonLegAverages ?? _wonLegAverages,
        wonSetAverages: wonSetAverages ?? _wonSetAverages,
        legs: legs ?? _legs,
        sets: sets ?? _sets,
        thrownPoints: thrownPoints ?? _thrownPoints,
        thrownPointsLeg: thrownPointsLeg ?? _thrownPointsLeg,
        thrownPointsSet: thrownPointsSet ?? _thrownPointsSet,
        d1: d1 ?? _d1,
        d2: d2 ?? _d2,
        dartsNeeded: dartsNeeded ?? _dartsNeeded,
        dartsNeededForLeg: dartsNeededForLeg ?? _dartsNeededForLeg,
        dartsNeededForSet: dartsNeededForSet ?? _dartsNeededForSet,
        thrownScores: thrownScores ?? _thrownScores);
  }

  */
}
