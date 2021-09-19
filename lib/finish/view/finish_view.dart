import 'dart:math';

import 'package:darts_high_finish_v2/finish/bloc/finish_bloc.dart';
import 'package:darts_high_finish_v2/finish/cubit/wait_ways_cubit.dart';
import 'package:darts_high_finish_v2/finish/finish_service/finish.dart';
import 'package:darts_high_finish_v2/finish/view/name_widget.dart';
import 'package:darts_high_finish_v2/finish/view/score_view.dart';
import 'package:darts_high_finish_v2/finish/view/wait_view.dart';
import 'package:darts_high_finish_v2/finish/view/ways_wait_keyboard_view.dart';
import 'package:darts_high_finish_v2/statistics/view/statistic_view.dart';
import 'package:darts_high_finish_v2/top/cubit/top_cubit.dart';
import 'package:darts_high_finish_v2/top/view/top_view.dart';
import 'package:darts_high_finish_v2/x01GameProperties/player.dart';
import 'package:darts_high_finish_v2/x01GameProperties/view/x01_game_properties.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinishView extends StatelessWidget {
  final List<Player> players;
  final String mode;
  final bool setLegMode;
  final int legsPerSet;
  final String lengthMode;
  final int matchLength;
  late List<Finish> finishes;
  late List<WaitWaysCubit> waitWaysCubits;

  FinishView(
      {required this.players,
      required this.mode,
      required this.setLegMode,
      required this.legsPerSet,
      required this.matchLength,
      required this.lengthMode}) {
    StartScoreObject startScore = StartScoreObject(mode);
    startScore.calculateScore();

    int ltwm = 1000;
    int stwm = 1000;

    if (lengthMode == 'First To') {
      ltwm = matchLength;
      stwm = matchLength;
    } else if (lengthMode == ' Best of') {
      ltwm = (matchLength / 2 as int) + 1;
      stwm = (matchLength / 2 as int) + 1;
    }
    finishes = [];
    waitWaysCubits = [];

    for (Player p in players) {
      finishes.add(Finish(
          name: p.name,
          d1: p.d1,
          d2: p.d2,
          setModeLegMode: setLegMode,
          legsToWinSet: legsPerSet,
          gameMode: mode,
          legsToWinMatch: ltwm,
          setsToWinMatch: stwm,
          score: startScore.score,
          startScoreObject: startScore));
      waitWaysCubits.add(WaitWaysCubit(active: p.doublesActivated ? 1 : 2));
    }

    
    Finish f;
    for (int i = 0; i < finishes.length; i++) {
      List<Finish> otherfinishes = [];
      f = finishes[i];
      otherfinishes.clear();
      for (int j = 0; j < finishes.length; j++) {
        if (i != j) {
          otherfinishes.add(finishes[j]);
        }
      }
      f.setOtherFinishes(otherfinishes);
    }
  }

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FinishBloc(
              waitWaysCubits: waitWaysCubits,
              finishes: finishes,
              players: players),
        ),
      ],
      child: TopView(
        child: PageView(
          children: [FinishViewContent(), StatisticView(key)],
          scrollDirection: Axis.horizontal,
          controller: controller,
        ),
      ),
    );
  }
}

class StartScoreObject {
  late int score;
  String gameMode;

  StartScoreObject(this.gameMode);

  void calculateScore() {
    switch (gameMode) {
      case '100-170':
        score = (calculate(1));
        break;
      case '170-301':
        score = (calculate(2));
        break;
      case '301':
        score = 301;
        break;
      case '401':
        score = 401;
        break;
      case '501':
        score = 501;
        break;
      case '601':
        score = 601;
        break;
      case '701':
        score = 701;
        break;
      case '801':
        score = 801;
        break;
      case '901':
        score = 901;
        break;
      case '1001':
        score = 1001;
        break;
    }
  }

  int calculate(int gameMode) {
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
      case 301:
        return 301;
      case 401:
        return 401;
      case 501:
        return 501;
      case 601:
        return 601;
      case 701:
        return 701;
      case 801:
        return 801;
      case 901:
        return 901;
      case 1001:
        return 101;
    }
    return 10;
  }

  bool not170() {
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
}

class FinishViewContent extends StatefulWidget {
  @override
  _FinishViewContentState createState() => _FinishViewContentState();
}

class _FinishViewContentState extends State<FinishViewContent> {
  @override
  void initState() {
    print('called init state');
    context.read<FinishBloc>().add(GameStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FinishBloc, FinishState>(
      listener: (context, state) {
        if (state.error) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.amber,
            content: Container(
              height: context.read<TopCubit>().state.safeAreaHeight * 0.058,
              child: Center(
                child: Text(
                  "Score not possible",
                  style: TextStyle(
                    fontSize: context.read<TopCubit>().state.value3,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ));
        }
      },
      child: Scaffold(
          body: Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [NameWidget(), Score(), WaysWaitKeyboard()],
        ),
      )),
    );
  }
}
