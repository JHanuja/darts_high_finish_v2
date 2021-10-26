import 'package:darts_high_finish_v2/finish/bloc/finish_bloc.dart';
import 'package:darts_high_finish_v2/finish/finish_service/finish.dart';
import 'package:darts_high_finish_v2/finish/finish_service/leg_statistic.dart';
import 'package:darts_high_finish_v2/top/cubit/top_cubit.dart';
import 'package:darts_high_finish_v2/top/view/top_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final key = GlobalKey<_StatisticViewState>();

class StatisticView extends StatefulWidget {
  const StatisticView(Key? key) : super(key: key);

  @override
  _StatisticViewState createState() => _StatisticViewState();
}

class _StatisticViewState extends State<StatisticView> {
  late int player;
  late int numberOfPlayers;
  late List<Finish> finishes;
  late bool scores171;

  @override
  void initState() {
    player = 1;
    scores171 = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<FinishBloc, FinishState>(
      builder: (context, state) {
        finishes = context.read<FinishBloc>().finishes;
        numberOfPlayers = finishes.length;
        TopCubit topCubit = context.read<TopCubit>();
        List<Widget> names = createNames(finishes);
        List<Widget> nameProperties = createProperties(names);
        List<Widget> sets = createSets(finishes);
        List<Widget> setProperties = createProperties(sets);
        List<Widget> legs = createLegs(finishes);
        List<Widget> legProperties = createProperties(legs);

        List<Widget> wonLegsPerSet = createWonLegsPerSet(finishes);
        List<Widget> wonLegsPerSetProperties = createProperties(wonLegsPerSet);

        List<Widget> averages = createAverages(finishes);
        List<Widget> averageProperties = createProperties(averages);
        List<Widget> scoringDarts = createScoringDarts(finishes);
        List<Widget> scoringProperties = createProperties(scoringDarts);
        List<Widget> firstNineDarts = createFirstNineDarts(finishes);
        List<Widget> firstNineDartsProperties =
            createProperties(firstNineDarts);
        List<Widget> bestWonLeg = createBestWonLeg(finishes);
        List<Widget> bestWonLegProperties = createProperties(bestWonLeg);
        List<Widget> legsWon = createLegsWon(finishes);
        List<Widget> legsWonProperties = createProperties(legsWon);
        List<Widget> avWonLegs = createAvWonLegs(finishes);
        List<Widget> avWonLegsProperties = createProperties(avWonLegs);
        List<Widget> highestScore = createHighestScore(finishes);
        List<Widget> highestScoreProperties = createProperties(highestScore);
        List<Widget> highestCheckout = createHighestCheckout(finishes);
        List<Widget> highestCheckoutProperties =
            createProperties(highestCheckout);
        List<Widget> avCheckout = createAvCheckout(finishes);
        List<Widget> avCheckoutProperties = createProperties(avCheckout);
        List<Widget> fiftyToNinetyNineCheckouts =
            createFiftyToNinetyNineCheckouts(finishes);
        List<Widget> fiftyToNinetyNineCheckoutsProperties =
            createProperties(fiftyToNinetyNineCheckouts);
        List<Widget> hundretPlusCheckouts =
            createHundretPlusCheckouts(finishes);
        List<Widget> hundretPlusCheckoutsProperties =
            createProperties(hundretPlusCheckouts);
        List<Widget> throws = createThrows(finishes);
        List<Widget> throwsProperties = createProperties(throws);

        List<Widget> throwsC1 = createThrowsC1(finishes);
        List<Widget> throwsC1Properties = createProperties(throwsC1);

        List<Widget> throwsC2 = createThrowsC2(finishes);
        List<Widget> throwsC2Properties = createProperties(throwsC2);

        List<Widget> throwsC3 = createThrowsC3(finishes);
        List<Widget> throwsC3Properties = createProperties(throwsC3);

        List<Widget> throwsC4 = createThrowsC4(finishes);
        List<Widget> throwsC4Properties = createProperties(throwsC4);

        List<Widget> throwsC5 = createThrowsC5(finishes);
        List<Widget> throwsC5Properties = createProperties(throwsC5);

        List<Widget> nineDartsNeededProperties = [];
        List<Widget> tenToTwelveDartsNeededProperties = [];
        List<Widget> thirteenToFifteenDartsNeededProperties = [];
        List<Widget> sixteenToEighteenDartsNeededProperties = [];
        List<Widget> nineTeenToTwentyOneDartsNeededProperties = [];
        List<Widget> twentyTwoToTwentyFourDartsNeededProperties = [];
        List<Widget> twentyFiveToTwentySevenDartsNeededProperties = [];
        List<Widget> twentyEightToThirtyDartsNeededProperties = [];
        List<Widget> thirtyOnePlusDartsNeededProperties = [];

        if (finishes[0].gameModeIs501 == 4) {
          List<Widget> nineDartsNeeded = createNineDartsNeeded(finishes);
          nineDartsNeededProperties = createProperties(nineDartsNeeded);

          List<Widget> tenToTwelveDartsNeeded =
              createTenToTwelveDartsNeeded(finishes);
          tenToTwelveDartsNeededProperties =
              createProperties(tenToTwelveDartsNeeded);

          List<Widget> thirteenToFifteenDartsNeeded =
              createThirteenToFifteenDartsNeeded(finishes);
          thirteenToFifteenDartsNeededProperties =
              createProperties(thirteenToFifteenDartsNeeded);

          List<Widget> sixteenToEighteenDartsNeeded =
              createSixteenToEighteenDartsNeeded(finishes);
          sixteenToEighteenDartsNeededProperties =
              createProperties(sixteenToEighteenDartsNeeded);

          List<Widget> nineTeenToTwentyOneDartsNeeded =
              createNineteenToTwentyOneDartsNeeded(finishes);
          nineTeenToTwentyOneDartsNeededProperties =
              createProperties(nineTeenToTwentyOneDartsNeeded);

          List<Widget> twentyTwoToTwentyFourDartsNeeded =
              createTwentyTwoToTwentyFourDartsNeeded(finishes);
          twentyTwoToTwentyFourDartsNeededProperties =
              createProperties(twentyTwoToTwentyFourDartsNeeded);

          List<Widget> twentyFiveToTwentySevenDartsNeeded =
              createTwentyFiveToTwentySevenDartsNeeded(finishes);
          twentyFiveToTwentySevenDartsNeededProperties =
              createProperties(twentyFiveToTwentySevenDartsNeeded);

          List<Widget> twentyEightToThirtyDartsNeeded =
              createTwentyEightToThirtyDartsNeeded(finishes);
          twentyEightToThirtyDartsNeededProperties =
              createProperties(twentyEightToThirtyDartsNeeded);

          List<Widget> thirtyOnePlusDartsNeeded =
              createThirtyOnePlusDartsNeeded(finishes);
          thirtyOnePlusDartsNeededProperties =
              createProperties(thirtyOnePlusDartsNeeded);
        }

        print(player.toString());
        print(names.length);
        print(nameProperties.length);

        return TopView(
          child: Container(
            color: Theme.of(context).backgroundColor,
            height: topCubit.state.safeAreaHeight,
            child: Column(
              children: [
                Container(
                  height: topCubit.state.safeAreaHeight * 0.07,
                  color: Theme.of(context).accentColor,
                  child: Row(children: [
                    Container(
                      width: topCubit.state.width * 0.4,
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: topCubit.state.width * 0.05),
                        child: Text(
                          finishes[0].gameMode,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    (player == 2 && numberOfPlayers > 2)
                        ? Container(
                            width: topCubit.state.width * 0.1,
                            child: createIcon(player))
                        : Container(),
                    nameProperties.isNotEmpty ? nameProperties[0] : Container(),
                    nameProperties.length >= 2 ? nameProperties[1] : Container(),
                    (player == 1 && numberOfPlayers > 2)
                        ? Container(
                            width: topCubit.state.width * 0.1,
                            child: createIcon(player))
                        : Container(),
                  ]),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(children: [
                      (!finishes[0].setModeLegMode)
                          ? Padding(
                              padding: EdgeInsets.only(
                                  bottom: topCubit.state.safeAreaHeight * 0.001),
                              child: Container(
                                color: Theme.of(context).hoverColor,
                                height: topCubit.state.safeAreaHeight * 0.07,
                                child: Row(children: [
                                  createCategory('Sets'),
                                  (player == 2 && numberOfPlayers > 2)
                                      ? Container(
                                          width: topCubit.state.width * 0.1)
                                      : Container(),
                                  setProperties.isNotEmpty
                                      ? setProperties[0]
                                      : Container(),
                                  setProperties.length >= 2
                                      ? setProperties[1]
                                      : Container(),
                                  (player == 1 && numberOfPlayers > 2)
                                      ? Container(
                                          width: topCubit.state.width * 0.1)
                                      : Container(),
                                ]),
                              ),
                            )
                          : Container(),
                      (finishes[0].setModeLegMode)
                          ? Container(
                              height: topCubit.state.safeAreaHeight * 0.07,
                              color: Theme.of(context).hoverColor,
                              child: Row(children: [
                                createCategory('Legs'),
                                (player == 2 && numberOfPlayers > 2)
                                    ? Container(width: topCubit.state.width * 0.1)
                                    : Container(),
                                legProperties.isNotEmpty
                                    ? legProperties[0]
                                    : Container(),
                                legProperties.length >= 2
                                    ? legProperties[1]
                                    : Container(),
                                (player == 1 && numberOfPlayers > 2)
                                    ? Container(width: topCubit.state.width * 0.1)
                                    : Container(),
                              ]),
                            )
                          : Container(
                              height: topCubit.state.safeAreaHeight * 0.07,
                              color: Theme.of(context).hoverColor,
                              child: Row(children: [
                                createCategory('Legs'),
                                (player == 2 && numberOfPlayers > 2)
                                    ? Container(width: topCubit.state.width * 0.1)
                                    : Container(),
                                wonLegsPerSetProperties.isNotEmpty
                                    ? wonLegsPerSetProperties[0]
                                    : Container(),
                                wonLegsPerSetProperties.length >= 2
                                    ? wonLegsPerSetProperties[1]
                                    : Container(),
                                (player == 1 && numberOfPlayers > 2)
                                    ? Container(width: topCubit.state.width * 0.1)
                                    : Container(),
                              ]),
                            ),
                      Container(
                          height: topCubit.state.safeAreaHeight * 0.05,
                          color: Theme.of(context).accentColor,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: topCubit.state.width * 0.05),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Average 3 Darts',
                                  style: TextStyle(
                                      color: Theme.of(context).errorColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          context.read<TopCubit>().state.value3)),
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: topCubit.state.safeAreaHeight * 0.001),
                        child: Container(
                          color: Theme.of(context).hoverColor,
                          height: topCubit.state.safeAreaHeight * 0.07,
                          child: Row(children: [
                            createCategory('Match'),
                            (player == 2 && numberOfPlayers > 2)
                                ? Container(width: topCubit.state.width * 0.1)
                                : Container(),
                            averageProperties.isNotEmpty
                                ? averageProperties[0]
                                : Container(),
                            averageProperties.length >= 2
                                ? averageProperties[1]
                                : Container(),
                            (player == 1 && numberOfPlayers > 2)
                                ? Container(width: topCubit.state.width * 0.1)
                                : Container(),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: topCubit.state.safeAreaHeight * 0.001),
                        child: Container(
                          color: Theme.of(context).hoverColor,
                          height: topCubit.state.safeAreaHeight * 0.07,
                          child: Row(children: [
                            createCategory('Scoring Darts'),
                            (player == 2 && numberOfPlayers > 2)
                                ? Container(width: topCubit.state.width * 0.1)
                                : Container(),
                            scoringProperties.isNotEmpty
                                ? scoringProperties[0]
                                : Container(),
                            scoringProperties.length >= 2
                                ? scoringProperties[1]
                                : Container(),
                            (player == 1 && numberOfPlayers > 2)
                                ? Container(width: topCubit.state.width * 0.1)
                                : Container(),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: topCubit.state.safeAreaHeight * 0.001),
                        child: Container(
                          color: Theme.of(context).hoverColor,
                          height: topCubit.state.safeAreaHeight * 0.07,
                          child: Row(children: [
                            createCategory('First Nine Darts'),
                            (player == 2 && numberOfPlayers > 2)
                                ? Container(width: topCubit.state.width * 0.1)
                                : Container(),
                            firstNineDartsProperties.isNotEmpty
                                ? firstNineDartsProperties[0]
                                : Container(),
                            firstNineDartsProperties.length >= 2
                                ? firstNineDartsProperties[1]
                                : Container(),
                            (player == 1 && numberOfPlayers > 2)
                                ? Container(width: topCubit.state.width * 0.1)
                                : Container(),
                          ]),
                        ),
                      ),
                      Container(
                          height: topCubit.state.safeAreaHeight * 0.05,
                          color: Theme.of(context).accentColor,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: topCubit.state.width * 0.05),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Records',
                                  style: TextStyle(
                                      color: Theme.of(context).errorColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          context.read<TopCubit>().state.value3)),
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: topCubit.state.safeAreaHeight * 0.001),
                        child: Container(
                          color: Theme.of(context).hoverColor,
                          height: topCubit.state.safeAreaHeight * 0.07,
                          child: Row(children: [
                            createCategory('Won Legs'),
                            (player == 2 && numberOfPlayers > 2)
                                ? Container(width: topCubit.state.width * 0.1)
                                : Container(),
                            legsWonProperties.isNotEmpty
                                ? legsWonProperties[0]
                                : Container(),
                            legsWonProperties.length >= 2
                                ? legsWonProperties[1]
                                : Container(),
                            (player == 1 && numberOfPlayers > 2)
                                ? Container(width: topCubit.state.width * 0.1)
                                : Container(),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: topCubit.state.safeAreaHeight * 0.001),
                        child: Container(
                          color: Theme.of(context).hoverColor,
                          height: topCubit.state.safeAreaHeight * 0.07,
                          child: Row(children: [
                            createCategory('Av Won Legs'),
                            (player == 2 && numberOfPlayers > 2)
                                ? Container(width: topCubit.state.width * 0.1)
                                : Container(),
                            avWonLegsProperties.isNotEmpty
                                ? avWonLegsProperties[0]
                                : Container(),
                            avWonLegsProperties.length >= 2
                                ? avWonLegsProperties[1]
                                : Container(),
                            (player == 1 && numberOfPlayers > 2)
                                ? Container(width: topCubit.state.width * 0.1)
                                : Container(),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: topCubit.state.safeAreaHeight * 0.001),
                        child: Container(
                          color: Theme.of(context).hoverColor,
                          height: topCubit.state.safeAreaHeight * 0.07,
                          child: Row(children: [
                            createCategory('Best Won Leg'),
                            (player == 2 && numberOfPlayers > 2)
                                ? Container(width: topCubit.state.width * 0.1)
                                : Container(),
                            bestWonLegProperties.isNotEmpty
                                ? bestWonLegProperties[0]
                                : Container(),
                            bestWonLegProperties.length >= 2
                                ? bestWonLegProperties[1]
                                : Container(),
                            (player == 1 && numberOfPlayers > 2)
                                ? Container(width: topCubit.state.width * 0.1)
                                : Container(),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: topCubit.state.safeAreaHeight * 0.001),
                        child: Container(
                          color: Theme.of(context).hoverColor,
                          height: topCubit.state.safeAreaHeight * 0.07,
                          child: Row(children: [
                            createCategory('Highest Score'),
                            (player == 2 && numberOfPlayers > 2)
                                ? Container(width: topCubit.state.width * 0.1)
                                : Container(),
                            highestScoreProperties.isNotEmpty
                                ? highestScoreProperties[0]
                                : Container(),
                            highestScoreProperties.length >= 2
                                ? highestScoreProperties[1]
                                : Container(),
                            (player == 1 && numberOfPlayers > 2)
                                ? Container(width: topCubit.state.width * 0.1)
                                : Container(),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: topCubit.state.safeAreaHeight * 0.001),
                        child: Container(
                          color: Theme.of(context).hoverColor,
                          height: topCubit.state.safeAreaHeight * 0.07,
                          child: Row(children: [
                            createCategory('Highest Checkout'),
                            (player == 2 && numberOfPlayers > 2)
                                ? Container(width: topCubit.state.width * 0.1)
                                : Container(),
                            highestCheckoutProperties.isNotEmpty
                                ? highestCheckoutProperties[0]
                                : Container(),
                            highestCheckoutProperties.length >= 2
                                ? highestCheckoutProperties[1]
                                : Container(),
                            (player == 1 && numberOfPlayers > 2)
                                ? Container(width: topCubit.state.width * 0.1)
                                : Container(),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: topCubit.state.safeAreaHeight * 0.001),
                        child: Container(
                          color: Theme.of(context).hoverColor,
                          height: topCubit.state.safeAreaHeight * 0.07,
                          child: Row(children: [
                            createCategory('Av Checkout'),
                            (player == 2 && numberOfPlayers > 2)
                                ? Container(width: topCubit.state.width * 0.1)
                                : Container(),
                            avCheckoutProperties.isNotEmpty
                                ? avCheckoutProperties[0]
                                : Container(),
                            avCheckoutProperties.length >= 2
                                ? avCheckoutProperties[1]
                                : Container(),
                            (player == 1 && numberOfPlayers > 2)
                                ? Container(width: topCubit.state.width * 0.1)
                                : Container(),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: topCubit.state.safeAreaHeight * 0.001),
                        child: Container(
                          color: Theme.of(context).hoverColor,
                          height: topCubit.state.safeAreaHeight * 0.07,
                          child: Row(children: [
                            createCategory('50-99 Checkouts'),
                            (player == 2 && numberOfPlayers > 2)
                                ? Container(width: topCubit.state.width * 0.1)
                                : Container(),
                            fiftyToNinetyNineCheckoutsProperties.isNotEmpty
                                ? fiftyToNinetyNineCheckoutsProperties[0]
                                : Container(),
                            fiftyToNinetyNineCheckoutsProperties.length >= 2
                                ? fiftyToNinetyNineCheckoutsProperties[1]
                                : Container(),
                            (player == 1 && numberOfPlayers > 2)
                                ? Container(width: topCubit.state.width * 0.1)
                                : Container(),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: topCubit.state.safeAreaHeight * 0.001),
                        child: Container(
                          color: Theme.of(context).hoverColor,
                          height: topCubit.state.safeAreaHeight * 0.07,
                          child: Row(children: [
                            createCategory('100+ Checkouts'),
                            (player == 2 && numberOfPlayers > 2)
                                ? Container(width: topCubit.state.width * 0.1)
                                : Container(),
                            hundretPlusCheckoutsProperties.isNotEmpty
                                ? hundretPlusCheckoutsProperties[0]
                                : Container(),
                            hundretPlusCheckoutsProperties.length >= 2
                                ? hundretPlusCheckoutsProperties[1]
                                : Container(),
                            (player == 1 && numberOfPlayers > 2)
                                ? Container(width: topCubit.state.width * 0.1)
                                : Container(),
                          ]),
                        ),
                      ),
                      Container(
                          height: topCubit.state.safeAreaHeight * 0.05,
                          color: Theme.of(context).accentColor,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: topCubit.state.width * 0.05),
                            child: Row(
                              children: [
                                Container(
                                  width: topCubit.state.width * 0.5,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Scores',
                                        style: TextStyle(
                                            color: Theme.of(context).errorColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: context
                                                .read<TopCubit>()
                                                .state
                                                .value3)),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          scores171 = true;
                                        });
                                      },
                                      child: Container(
                                        height:
                                            topCubit.state.safeAreaHeight * 0.05,
                                        width: topCubit.state.width * 0.25,
                                        color: scores171
                                            ? Theme.of(context).shadowColor
                                            : Theme.of(context).accentColor,
                                        child: Center(
                                          child: Text('171',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .errorColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: context
                                                      .read<TopCubit>()
                                                      .state
                                                      .value3)),
                                        ),
                                      )),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        scores171 = false;
                                      });
                                    },
                                    child: Container(
                                      height:
                                          topCubit.state.safeAreaHeight * 0.05,
                                      width: topCubit.state.width * 0.25,
                                      color: !scores171
                                          ? Theme.of(context).shadowColor
                                          : Theme.of(context).accentColor,
                                      child: Center(
                                        child: Text('180',
                                            style: TextStyle(
                                                color:
                                                    Theme.of(context).errorColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: context
                                                    .read<TopCubit>()
                                                    .state
                                                    .value3)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: topCubit.state.safeAreaHeight * 0.001),
                        child: Container(
                          color: Theme.of(context).hoverColor,
                          height: topCubit.state.safeAreaHeight * 0.07,
                          child: Row(children: [
                            createCategory('Throws'),
                            (player == 2 && numberOfPlayers > 2)
                                ? Container(width: topCubit.state.width * 0.1)
                                : Container(),
                            throwsProperties.isNotEmpty
                                ? throwsProperties[0]
                                : Container(),
                            throwsProperties.length >= 2
                                ? throwsProperties[1]
                                : Container(),
                            (player == 1 && numberOfPlayers > 2)
                                ? Container(width: topCubit.state.width * 0.1)
                                : Container(),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: topCubit.state.safeAreaHeight * 0.001),
                        child: Container(
                          color: Theme.of(context).hoverColor,
                          height: topCubit.state.safeAreaHeight * 0.07,
                          child: Row(children: [
                            createCategory(scores171 ? '51+' : '60+'),
                            (player == 2 && numberOfPlayers > 2)
                                ? Container(width: topCubit.state.width * 0.1)
                                : Container(),
                            throwsC1Properties.isNotEmpty
                                ? throwsC1Properties[0]
                                : Container(),
                            throwsC1Properties.length >= 2
                                ? throwsC1Properties[1]
                                : Container(),
                            (player == 1 && numberOfPlayers > 2)
                                ? Container(width: topCubit.state.width * 0.1)
                                : Container(),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: topCubit.state.safeAreaHeight * 0.001),
                        child: Container(
                          color: Theme.of(context).hoverColor,
                          height: topCubit.state.safeAreaHeight * 0.07,
                          child: Row(children: [
                            createCategory(scores171 ? '71+' : '80+'),
                            (player == 2 && numberOfPlayers > 2)
                                ? Container(width: topCubit.state.width * 0.1)
                                : Container(),
                            throwsC2Properties.isNotEmpty
                                ? throwsC2Properties[0]
                                : Container(),
                            throwsC2Properties.length >= 2
                                ? throwsC2Properties[1]
                                : Container(),
                            (player == 1 && numberOfPlayers > 2)
                                ? Container(width: topCubit.state.width * 0.1)
                                : Container(),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: topCubit.state.safeAreaHeight * 0.001),
                        child: Container(
                          color: Theme.of(context).hoverColor,
                          height: topCubit.state.safeAreaHeight * 0.07,
                          child: Row(children: [
                            createCategory(scores171 ? '91+' : '100+'),
                            (player == 2 && numberOfPlayers > 2)
                                ? Container(width: topCubit.state.width * 0.1)
                                : Container(),
                            throwsC3Properties.isNotEmpty
                                ? throwsC3Properties[0]
                                : Container(),
                            throwsC3Properties.length >= 2
                                ? throwsC3Properties[1]
                                : Container(),
                            (player == 1 && numberOfPlayers > 2)
                                ? Container(width: topCubit.state.width * 0.1)
                                : Container(),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: topCubit.state.safeAreaHeight * 0.001),
                        child: Container(
                          color: Theme.of(context).hoverColor,
                          height: topCubit.state.safeAreaHeight * 0.07,
                          child: Row(children: [
                            createCategory(scores171 ? '131+' : '140+'),
                            (player == 2 && numberOfPlayers > 2)
                                ? Container(width: topCubit.state.width * 0.1)
                                : Container(),
                            throwsC4Properties.isNotEmpty
                                ? throwsC4Properties[0]
                                : Container(),
                            throwsC4Properties.length >= 2
                                ? throwsC4Properties[1]
                                : Container(),
                            (player == 1 && numberOfPlayers > 2)
                                ? Container(width: topCubit.state.width * 0.1)
                                : Container(),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: topCubit.state.safeAreaHeight * 0.001),
                        child: Container(
                          color: Theme.of(context).hoverColor,
                          height: topCubit.state.safeAreaHeight * 0.07,
                          child: Row(children: [
                            createCategory(scores171 ? '171+' : '180'),
                            (player == 2 && numberOfPlayers > 2)
                                ? Container(width: topCubit.state.width * 0.1)
                                : Container(),
                            throwsC5Properties.isNotEmpty
                                ? throwsC5Properties[0]
                                : Container(),
                            throwsC5Properties.length >= 2
                                ? throwsC5Properties[1]
                                : Container(),
                            (player == 1 && numberOfPlayers > 2)
                                ? Container(width: topCubit.state.width * 0.1)
                                : Container(),
                          ]),
                        ),
                      ),
                      (finishes[0].gameModeIs501 == 4)
                          ? Container(
                              height: topCubit.state.safeAreaHeight * 0.05,
                              color: Theme.of(context).accentColor,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: topCubit.state.width * 0.05),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Darts to win',
                                      style: TextStyle(
                                          color: Theme.of(context).errorColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: context
                                              .read<TopCubit>()
                                              .state
                                              .value3)),
                                ),
                              ))
                          : Container(),
                      (finishes[0].gameModeIs501 == 4)
                          ? Padding(
                              padding: EdgeInsets.only(
                                  bottom: topCubit.state.safeAreaHeight * 0.001),
                              child: Container(
                                color: Theme.of(context).hoverColor,
                                height: topCubit.state.safeAreaHeight * 0.07,
                                child: Row(children: [
                                  createCategory('9'),
                                  (player == 2 && numberOfPlayers > 2)
                                      ? Container(
                                          width: topCubit.state.width * 0.1)
                                      : Container(),
                                  nineDartsNeededProperties.isNotEmpty
                                      ? nineDartsNeededProperties[0]
                                      : Container(),
                                  nineDartsNeededProperties.length >= 2
                                      ? nineDartsNeededProperties[1]
                                      : Container(),
                                  (player == 1 && numberOfPlayers > 2)
                                      ? Container(
                                          width: topCubit.state.width * 0.1)
                                      : Container(),
                                ]),
                              ),
                            )
                          : Container(),
                      (finishes[0].gameModeIs501 == 4)
                          ? Padding(
                              padding: EdgeInsets.only(
                                  bottom: topCubit.state.safeAreaHeight * 0.001),
                              child: Container(
                                color: Theme.of(context).hoverColor,
                                height: topCubit.state.safeAreaHeight * 0.07,
                                child: Row(children: [
                                  createCategory('10-12'),
                                  (player == 2 && numberOfPlayers > 2)
                                      ? Container(
                                          width: topCubit.state.width * 0.1)
                                      : Container(),
                                  tenToTwelveDartsNeededProperties.isNotEmpty
                                      ? tenToTwelveDartsNeededProperties[0]
                                      : Container(),
                                  tenToTwelveDartsNeededProperties.length >= 2
                                      ? tenToTwelveDartsNeededProperties[1]
                                      : Container(),
                                  (player == 1 && numberOfPlayers > 2)
                                      ? Container(
                                          width: topCubit.state.width * 0.1)
                                      : Container(),
                                ]),
                              ),
                            )
                          : Container(),
                      (finishes[0].gameModeIs501 == 4)
                          ? Padding(
                              padding: EdgeInsets.only(
                                  bottom: topCubit.state.safeAreaHeight * 0.001),
                              child: Container(
                                color: Theme.of(context).hoverColor,
                                height: topCubit.state.safeAreaHeight * 0.07,
                                child: Row(children: [
                                  createCategory('13-15'),
                                  (player == 2 && numberOfPlayers > 2)
                                      ? Container(
                                          width: topCubit.state.width * 0.1)
                                      : Container(),
                                  thirteenToFifteenDartsNeededProperties
                                          .isNotEmpty
                                      ? thirteenToFifteenDartsNeededProperties[0]
                                      : Container(),
                                  thirteenToFifteenDartsNeededProperties.length >=
                                          2
                                      ? thirteenToFifteenDartsNeededProperties[1]
                                      : Container(),
                                  (player == 1 && numberOfPlayers > 2)
                                      ? Container(
                                          width: topCubit.state.width * 0.1)
                                      : Container(),
                                ]),
                              ),
                            )
                          : Container(),
                      (finishes[0].gameModeIs501 == 4)
                          ? Padding(
                              padding: EdgeInsets.only(
                                  bottom: topCubit.state.safeAreaHeight * 0.001),
                              child: Container(
                                color: Theme.of(context).hoverColor,
                                height: topCubit.state.safeAreaHeight * 0.07,
                                child: Row(children: [
                                  createCategory('16-18'),
                                  (player == 2 && numberOfPlayers > 2)
                                      ? Container(
                                          width: topCubit.state.width * 0.1)
                                      : Container(),
                                  sixteenToEighteenDartsNeededProperties
                                          .isNotEmpty
                                      ? sixteenToEighteenDartsNeededProperties[0]
                                      : Container(),
                                  sixteenToEighteenDartsNeededProperties.length >=
                                          2
                                      ? sixteenToEighteenDartsNeededProperties[1]
                                      : Container(),
                                  (player == 1 && numberOfPlayers > 2)
                                      ? Container(
                                          width: topCubit.state.width * 0.1)
                                      : Container(),
                                ]),
                              ),
                            )
                          : Container(),
                      (finishes[0].gameModeIs501 == 4)
                          ? Padding(
                              padding: EdgeInsets.only(
                                  bottom: topCubit.state.safeAreaHeight * 0.001),
                              child: Container(
                                color: Theme.of(context).hoverColor,
                                height: topCubit.state.safeAreaHeight * 0.07,
                                child: Row(children: [
                                  createCategory('19-21'),
                                  (player == 2 && numberOfPlayers > 2)
                                      ? Container(
                                          width: topCubit.state.width * 0.1)
                                      : Container(),
                                  nineTeenToTwentyOneDartsNeededProperties
                                          .isNotEmpty
                                      ? nineTeenToTwentyOneDartsNeededProperties[
                                          0]
                                      : Container(),
                                  nineTeenToTwentyOneDartsNeededProperties
                                              .length >=
                                          2
                                      ? nineTeenToTwentyOneDartsNeededProperties[
                                          1]
                                      : Container(),
                                  (player == 1 && numberOfPlayers > 2)
                                      ? Container(
                                          width: topCubit.state.width * 0.1)
                                      : Container(),
                                ]),
                              ),
                            )
                          : Container(),
                      (finishes[0].gameModeIs501 == 4)
                          ? Padding(
                              padding: EdgeInsets.only(
                                  bottom: topCubit.state.safeAreaHeight * 0.001),
                              child: Container(
                                color: Theme.of(context).hoverColor,
                                height: topCubit.state.safeAreaHeight * 0.07,
                                child: Row(children: [
                                  createCategory('22-24'),
                                  (player == 2 && numberOfPlayers > 2)
                                      ? Container(
                                          width: topCubit.state.width * 0.1)
                                      : Container(),
                                  twentyTwoToTwentyFourDartsNeededProperties
                                          .isNotEmpty
                                      ? twentyTwoToTwentyFourDartsNeededProperties[
                                          0]
                                      : Container(),
                                  twentyTwoToTwentyFourDartsNeededProperties
                                              .length >=
                                          2
                                      ? twentyTwoToTwentyFourDartsNeededProperties[
                                          1]
                                      : Container(),
                                  (player == 1 && numberOfPlayers > 2)
                                      ? Container(
                                          width: topCubit.state.width * 0.1)
                                      : Container(),
                                ]),
                              ),
                            )
                          : Container(),
                      (finishes[0].gameModeIs501 == 4)
                          ? Padding(
                              padding: EdgeInsets.only(
                                  bottom: topCubit.state.safeAreaHeight * 0.001),
                              child: Container(
                                color: Theme.of(context).hoverColor,
                                height: topCubit.state.safeAreaHeight * 0.07,
                                child: Row(children: [
                                  createCategory('25-27'),
                                  (player == 2 && numberOfPlayers > 2)
                                      ? Container(
                                          width: topCubit.state.width * 0.1)
                                      : Container(),
                                  twentyFiveToTwentySevenDartsNeededProperties
                                          .isNotEmpty
                                      ? twentyFiveToTwentySevenDartsNeededProperties[
                                          0]
                                      : Container(),
                                  twentyFiveToTwentySevenDartsNeededProperties
                                              .length >=
                                          2
                                      ? twentyFiveToTwentySevenDartsNeededProperties[
                                          1]
                                      : Container(),
                                  (player == 1 && numberOfPlayers > 2)
                                      ? Container(
                                          width: topCubit.state.width * 0.1)
                                      : Container(),
                                ]),
                              ),
                            )
                          : Container(),
                      (finishes[0].gameModeIs501 == 4)
                          ? Padding(
                              padding: EdgeInsets.only(
                                  bottom: topCubit.state.safeAreaHeight * 0.001),
                              child: Container(
                                color: Theme.of(context).hoverColor,
                                height: topCubit.state.safeAreaHeight * 0.07,
                                child: Row(children: [
                                  createCategory('28-30'),
                                  (player == 2 && numberOfPlayers > 2)
                                      ? Container(
                                          width: topCubit.state.width * 0.1)
                                      : Container(),
                                  twentyEightToThirtyDartsNeededProperties
                                          .isNotEmpty
                                      ? twentyEightToThirtyDartsNeededProperties[
                                          0]
                                      : Container(),
                                  twentyEightToThirtyDartsNeededProperties
                                              .length >=
                                          2
                                      ? twentyEightToThirtyDartsNeededProperties[
                                          1]
                                      : Container(),
                                  (player == 1 && numberOfPlayers > 2)
                                      ? Container(
                                          width: topCubit.state.width * 0.1)
                                      : Container(),
                                ]),
                              ),
                            )
                          : Container(),
                      (finishes[0].gameModeIs501 == 4)
                          ? Padding(
                              padding: EdgeInsets.only(
                                  bottom: topCubit.state.safeAreaHeight * 0.001),
                              child: Container(
                                color: Theme.of(context).hoverColor,
                                height: topCubit.state.safeAreaHeight * 0.07,
                                child: Row(children: [
                                  createCategory('31+'),
                                  (player == 2 && numberOfPlayers > 2)
                                      ? Container(
                                          width: topCubit.state.width * 0.1)
                                      : Container(),
                                  thirtyOnePlusDartsNeededProperties.isNotEmpty
                                      ? thirtyOnePlusDartsNeededProperties[0]
                                      : Container(),
                                  thirtyOnePlusDartsNeededProperties.length >= 2
                                      ? thirtyOnePlusDartsNeededProperties[1]
                                      : Container(),
                                  (player == 1 && numberOfPlayers > 2)
                                      ? Container(
                                          width: topCubit.state.width * 0.1)
                                      : Container(),
                                ]),
                              ),
                            )
                          : Container(),
                      ...finishes[0].setModeLegMode
                          ? createGameAllLegs(finishes, topCubit)
                          : createGameAllSets(finishes, topCubit),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ));
  }

  List<Widget> createGameAllLegs(List<Finish> finishes, TopCubit topCubit) {
    List<Widget> list = [];
    list.add(finishes[0].legs > 1
        ? Container(
            height: topCubit.state.safeAreaHeight * 0.05,
            color: Theme.of(context).accentColor,
            child: Padding(
              padding: EdgeInsets.only(left: topCubit.state.width * 0.05),
              child: Row(
                children: [
                  Container(
                    width: topCubit.state.width * 0.5,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Legs',
                          style: TextStyle(
                              color: Theme.of(context).errorColor,
                              fontWeight: FontWeight.bold,
                              fontSize: context.read<TopCubit>().state.value3)),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Container());

    List<List<Widget>> l =
        createPropertiesLegs(createSingleLegs(finishes, topCubit, true));

    for (int j = 0; j < l[0].length; j++) {
      print(l[0].toString());
      print(l[1].toString());
      print(numberOfPlayers);
      list.add(Padding(
        padding: EdgeInsets.only(bottom: topCubit.state.safeAreaHeight * 0.001),
        child: Container(
          color: Theme.of(context).hoverColor,
          height: topCubit.state.safeAreaHeight * 0.07,
          child: Row(children: [
            createCategory(
                'Leg ' + finishes[0].legStatistics[j].legNumber.toString()),
            (player == 2 && numberOfPlayers > 2)
                ? Container(width: topCubit.state.width * 0.1)
                : Container(),
            l.isNotEmpty ? l[0][j] : Container(),
            l.length >= 2 ? l[1][j] : Container(),
            (player == 1 && numberOfPlayers > 2)
                ? Container(width: topCubit.state.width * 0.1)
                : Container(),
          ]),
        ),
      ));
    }
    return list;
  }

  List<List<Widget>> createSingleLegs(
      List<Finish> finishes, TopCubit topCubit, bool legMode,
      [int? setNumber]) {
    List<List<Widget>> l = [];

    if (legMode) {
      for (int i = 0; i < finishes.length; i++) {
        List<Widget> k = [];
        for (int j = 0; j < finishes[i].legStatistics.length; j++) {
          k.add(Expanded(
            child: Center(
                child: Text(
                    finishes[i].legStatistics[j].legAverage.toStringAsFixed(2),
                    style: TextStyle(
                        color: Theme.of(context).cardColor,
                        fontWeight: finishes[i].legStatistics[j].won
                            ? FontWeight.bold
                            : FontWeight.normal,
                        fontSize: context.read<TopCubit>().state.value3))),
          ));
        }
        l.add(k);
      }
    } else {
      if (finishes[0].setStatistics.isNotEmpty && setNumber != -1) {
        for (int i = 0; i < finishes.length; i++) {
          List<Widget> k = [];
          for (int j = 0;
              j < finishes[i].setStatistics[setNumber!].legs.length;
              j++) {
            k.add(Expanded(
              child: Center(
                  child: Text(
                      finishes[i]
                          .setStatistics[setNumber]
                          .legs[j]
                          .legAverage
                          .toStringAsFixed(2),
                      style: TextStyle(
                          color: Theme.of(context).errorColor,
                          fontWeight: finishes[i].legStatistics[j].won
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontSize: context.read<TopCubit>().state.value3))),
            ));
          }
          l.add(k);
        }
      }

      if (setNumber == -1) {
        for (int i = 0; i < finishes.length; i++) {
          List<Widget> k = [];
          for (int j = 0; j < finishes[i].setStatistic.legs.length; j++) {
            k.add(Expanded(
              child: Center(
                  child: Text(
                      finishes[i]
                          .setStatistic
                          .legs[j]
                          .legAverage
                          .toStringAsFixed(2),
                      style: TextStyle(
                          color: Theme.of(context).errorColor,
                          fontWeight: finishes[i].setStatistic.legs[j].won
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontSize: context.read<TopCubit>().state.value3))),
            ));
            l.add(k);
          }
        }
      }
    }

    return l;
  }

  List<Widget> createGameAllSets(List<Finish> finishes, TopCubit topCubit) {
    List<Widget> list = [];

    int finishedSets = 0;

    for (int i = 0; i < finishes[0].setStatistics.length; i++) {
      list.add(createSetNumberWidget(i + 1, topCubit));
      List<List<Widget>> l =
          createPropertiesLegs(createSingleLegs(finishes, topCubit, false, i));

      for (int j = 0; j < l[0].length; j++) {
        print(l[0].toString());
        //print(l[1].toString());
        print(numberOfPlayers);
        list.add(Padding(
          padding:
              EdgeInsets.only(bottom: topCubit.state.safeAreaHeight * 0.001),
          child: Container(
            color: Theme.of(context).hoverColor,
            height: topCubit.state.safeAreaHeight * 0.07,
            child: Row(children: [
              createCategory('Leg ' + (j + 1).toString()),
              (player == 2 && numberOfPlayers > 2)
                  ? Container(width: topCubit.state.width * 0.1)
                  : Container(),
              l.isNotEmpty ? l[0][j] : Container(),
              l.length >= 2 ? l[1][j] : Container(),
              (player == 1 && numberOfPlayers > 2)
                  ? Container(width: topCubit.state.width * 0.1)
                  : Container(),
            ]),
          ),
        ));
      }

      List<Widget> setAverages = createSetAverage(finishes,i);
      List<Widget> setAveragesProperties = createProperties(setAverages);

      list.add(Padding(
        padding: EdgeInsets.only(bottom: topCubit.state.safeAreaHeight * 0.001),
        child: Container(
          color: Theme.of(context).hoverColor,
          height: topCubit.state.safeAreaHeight * 0.07,
          child: Row(children: [
            createCategory('Av Set'),
            (player == 2 && numberOfPlayers > 2)
                ? Container(width: topCubit.state.width * 0.1)
                : Container(),
            setAveragesProperties.isNotEmpty ? setAveragesProperties[0] : Container(),
            setAveragesProperties.length >= 2 ? setAveragesProperties[1] : Container(),
            (player == 1 && numberOfPlayers > 2)
                ? Container(width: topCubit.state.width * 0.1)
                : Container(),
          ]),
        ),
      ));

      finishedSets = i + 1;
    }

    if (finishes[0].setStatistic.legs.isNotEmpty) {
      list.add(createSetNumberWidget(finishedSets + 1, topCubit));
      List<List<Widget>> unfinishedSetLegs =
          createPropertiesLegs(createSingleLegs(finishes, topCubit, false, -1));

      print('I am here');
      for (int j = 0; j < unfinishedSetLegs[0].length; j++) {
        list.add(Padding(
          padding:
              EdgeInsets.only(bottom: topCubit.state.safeAreaHeight * 0.001),
          child: Container(
            color: Theme.of(context).hoverColor,
            height: topCubit.state.safeAreaHeight * 0.07,
            child: Row(children: [
              createCategory('Leg ' + (j + 1).toString()),
              (player == 2 && numberOfPlayers > 2)
                  ? Container(width: topCubit.state.width * 0.1)
                  : Container(),
              unfinishedSetLegs.isNotEmpty
                  ? unfinishedSetLegs[0][j]
                  : Container(),
              unfinishedSetLegs.length >= 2
                  ? unfinishedSetLegs[1][j]
                  : Container(),
              (player == 1 && numberOfPlayers > 2)
                  ? Container(width: topCubit.state.width * 0.1)
                  : Container(),
            ]),
          ),
        ));
      }
    }

    print(list.toString());
    return list;
  }

  Widget createSetNumberWidget(int setNumber, TopCubit topCubit) {
    return Container(
      height: topCubit.state.safeAreaHeight * 0.05,
      color: Theme.of(context).accentColor,
      child: Padding(
        padding: EdgeInsets.only(left: topCubit.state.width * 0.05),
        child: Row(
          children: [
            Container(
              width: topCubit.state.width * 0.5,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Set ' + setNumber.toString(),
                    style: TextStyle(
                        color: Theme.of(context).errorColor,
                        fontWeight: FontWeight.bold,
                        fontSize: context.read<TopCubit>().state.value3)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget createCategory(String c) {
    return Container(
      width: context.read<TopCubit>().state.width * 0.4,
      child: Padding(
        padding:
            EdgeInsets.only(left: context.read<TopCubit>().state.width * 0.05),
        child: Text(
          c,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).cardColor,
              fontSize: context.read<TopCubit>().state.value3),
        ),
      ),
    );
  }

  List<List<Widget>> createPropertiesLegs(List<List<Widget>> properties) {
    List<List<Widget>> l = [];
    if (numberOfPlayers == 1) {
      l.add(properties[0]);
      return l;
    }

    if (numberOfPlayers == 2) {
      l.add(properties[0]);
      l.add(properties[1]);
      return l;
    }

    if (numberOfPlayers == 3 && player == 1) {
      l.add(properties[0]);
      l.add(properties[1]);
      return l;
    }

    if (numberOfPlayers == 3 && player == 2) {
      l.add(properties[1]);
      l.add(properties[2]);
      return l;
    }

    if (numberOfPlayers == 4 && player == 1) {
      l.add(properties[0]);
      l.add(properties[1]);
      return l;
    }

    if (numberOfPlayers == 4 && player == 2) {
      l.add(properties[2]);
      l.add(properties[3]);
      return l;
    }

    return l;
  }

  List<Widget> createProperties(List<Widget> properties) {
    List<Widget> l = [];
    if (numberOfPlayers == 1) {
      l.add(properties[0]);
      return l;
    }

    if (numberOfPlayers == 2) {
      l.add(properties[0]);
      l.add(properties[1]);
      return l;
    }

    if (numberOfPlayers == 3 && player == 1) {
      l.add(properties[0]);
      l.add(properties[1]);
      return l;
    }

    if (numberOfPlayers == 3 && player == 2) {
      l.add(properties[1]);
      l.add(properties[2]);
      return l;
    }

    if (numberOfPlayers == 4 && player == 1) {
      l.add(properties[0]);
      l.add(properties[1]);
      return l;
    }

    if (numberOfPlayers == 4 && player == 2) {
      l.add(properties[2]);
      l.add(properties[3]);
      return l;
    }

    return l;
  }

  IconButton createIcon(int selectedPlayer) {
    if (player == 2) {
      return IconButton(
          onPressed: () {
            setState(() {
              player -= 1;
            });
          },
          icon: Icon(Icons.arrow_back));
    } else {
      return IconButton(
          onPressed: () {
            print('called');
            setState(() {
              player += 1;
            });
          },
          icon: Icon(Icons.arrow_forward));
    }
  }

  List<Widget> createNames(List<Finish> finishes) {
    List<Widget> l = [];
    for (int i = 0; i < finishes.length; i++) {
      l.add(Expanded(
        child: Center(
            child: Text(finishes[i].name,
                style: TextStyle(
                    color: Theme.of(context).errorColor,
                    fontSize: context.read<TopCubit>().state.value3))),
      ));
    }
    return l;
  }

  List<Widget> createSetAverage(List<Finish> finishes, int set) {
    List<Widget> l = [];
    for (int i = 0; i < finishes.length; i++) {
      l.add(Expanded(
        child: Center(
            child: Text(finishes[i].setStatistics[set].av.toStringAsFixed(2),
                style: TextStyle(
                    color: Theme.of(context).errorColor,
                    fontSize: context.read<TopCubit>().state.value3))),
      ));
    }
    return l;
  }

  List<Widget> createSets(List<Finish> finishes) {
    List<Widget> l = [];
    for (int i = 0; i < finishes.length; i++) {
      l.add(Expanded(
        child: Center(
            child: Text(finishes[i].wonSets.toString(),
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: context.read<TopCubit>().state.value3))),
      ));
    }
    return l;
  }

  List<Widget> createLegs(List<Finish> finishes) {
    List<Widget> l = [];
    for (int i = 0; i < finishes.length; i++) {
      l.add(Expanded(
        child: Center(
            child: Text(finishes[i].wonLegs.toString(),
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: context.read<TopCubit>().state.value3))),
      ));
    }
    return l;
  }

  List<Widget> createAverages(List<Finish> finishes) {
    List<Widget> l = [];
    for (int i = 0; i < finishes.length; i++) {
      l.add(Expanded(
        child: Center(
            child: Text(
                (finishes[i].average != -1.0)
                    ? finishes[i].average.toStringAsFixed(2)
                    : '-',
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: context.read<TopCubit>().state.value3))),
      ));
    }
    return l;
  }

  List<Widget> createScoringDarts(List<Finish> finishes) {
    List<Widget> l = [];
    for (int i = 0; i < finishes.length; i++) {
      l.add(Expanded(
        child: Center(
            child: Text(
                (finishes[i].averageScoringDarts != -1.0)
                    ? finishes[i].averageScoringDarts.toStringAsFixed(2)
                    : '-',
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: context.read<TopCubit>().state.value3))),
      ));
    }
    return l;
  }

  List<Widget> createFirstNineDarts(List<Finish> finishes) {
    List<Widget> l = [];
    for (int i = 0; i < finishes.length; i++) {
      l.add(Expanded(
        child: Center(
            child: Text(
                (finishes[i].averageFirstNineDarts != -1.0)
                    ? finishes[i].averageFirstNineDarts.toStringAsFixed(2)
                    : '-',
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: context.read<TopCubit>().state.value3))),
      ));
    }
    return l;
  }

  List<Widget> createBestWonLeg(List<Finish> finishes) {
    List<Widget> l = [];
    for (int i = 0; i < finishes.length; i++) {
      l.add(Expanded(
        child: Center(
            child: Text(
                (finishes[i].bestWonLeg != -1.0)
                    ? finishes[i].bestWonLeg.toStringAsFixed(2)
                    : '-',
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: context.read<TopCubit>().state.value3))),
      ));
    }

    return l;
  }

  List<Widget> createLegsWon(List<Finish> finishes) {
    List<Widget> l = [];
    for (int i = 0; i < finishes.length; i++) {
      l.add(Expanded(
        child: Center(
            child: Text(
                (finishes[i].wonLegs != -1.0)
                    ? finishes[i].wonLegs.toString()
                    : '-',
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: context.read<TopCubit>().state.value3))),
      ));
    }

    return l;
  }

  List<Widget> createAvWonLegs(List<Finish> finishes) {
    List<Widget> l = [];
    for (int i = 0; i < finishes.length; i++) {
      l.add(Expanded(
        child: Center(
            child: Text(
                (finishes[i].averageWonLegs != -1.0)
                    ? finishes[i].averageWonLegs.toStringAsFixed(2)
                    : '-',
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: context.read<TopCubit>().state.value3))),
      ));
    }

    return l;
  }

  List<Widget> createHighestScore(List<Finish> finishes) {
    List<Widget> l = [];
    for (int i = 0; i < finishes.length; i++) {
      l.add(Expanded(
        child: Center(
            child: Text(
                (finishes[i].highestScore != -1.0)
                    ? finishes[i].highestScore.toString()
                    : '-',
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: context.read<TopCubit>().state.value3))),
      ));
    }

    return l;
  }

  List<Widget> createHighestCheckout(List<Finish> finishes) {
    List<Widget> l = [];
    for (int i = 0; i < finishes.length; i++) {
      l.add(Expanded(
        child: Center(
            child: Text(
                (finishes[i].highestCheckout != -1.0)
                    ? finishes[i].highestCheckout.toString()
                    : '-',
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: context.read<TopCubit>().state.value3))),
      ));
    }

    return l;
  }

  List<Widget> createAvCheckout(List<Finish> finishes) {
    List<Widget> l = [];
    for (int i = 0; i < finishes.length; i++) {
      l.add(Expanded(
        child: Center(
            child: Text(
                (finishes[i].checkOutAverage != -1.0)
                    ? finishes[i].checkOutAverage.toStringAsFixed(2)
                    : '-',
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: context.read<TopCubit>().state.value3))),
      ));
    }

    return l;
  }

  List<Widget> createFiftyToNinetyNineCheckouts(List<Finish> finishes) {
    List<Widget> l = [];
    for (int i = 0; i < finishes.length; i++) {
      l.add(Expanded(
        child: Center(
            child: Text(
                (finishes[i].fiftyToNinetyNineCheckouts != -1.0)
                    ? finishes[i].fiftyToNinetyNineCheckouts.toString()
                    : '-',
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: context.read<TopCubit>().state.value3))),
      ));
    }

    return l;
  }

  List<Widget> createHundretPlusCheckouts(List<Finish> finishes) {
    List<Widget> l = [];
    for (int i = 0; i < finishes.length; i++) {
      l.add(Expanded(
        child: Center(
            child: Text(
                (finishes[i].hundretPlusCheckout != -1.0)
                    ? finishes[i].hundretPlusCheckout.toString()
                    : '-',
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: context.read<TopCubit>().state.value3))),
      ));
    }

    return l;
  }

  List<Widget> createThrows(List<Finish> finishes) {
    List<Widget> l = [];
    for (int i = 0; i < finishes.length; i++) {
      l.add(Expanded(
        child: Center(
            child: Text(
                (finishes[i].throwCount != -1.0)
                    ? finishes[i].throwCount.toString()
                    : '-',
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: context.read<TopCubit>().state.value3))),
      ));
    }

    return l;
  }

  List<Widget> createThrowsC1(List<Finish> finishes) {
    List<Widget> l = [];
    for (int i = 0; i < finishes.length; i++) {
      l.add(Expanded(
        child: Center(
            child: Text(
                (scores171
                    ? (finishes[i].fiftyOneplus != -1.0)
                        ? finishes[i].fiftyOneplus.toString()
                        : '-'
                    : (finishes[i].sixtyPlus != -1.0)
                        ? finishes[i].sixtyPlus.toString()
                        : '-'),
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: context.read<TopCubit>().state.value3))),
      ));
    }

    return l;
  }

  List<Widget> createThrowsC2(List<Finish> finishes) {
    List<Widget> l = [];
    for (int i = 0; i < finishes.length; i++) {
      l.add(Expanded(
        child: Center(
            child: Text(
                (scores171
                    ? (finishes[i].seventyOneplus != -1.0)
                        ? finishes[i].seventyOneplus.toString()
                        : '-'
                    : (finishes[i].eightyPlus != -1.0)
                        ? finishes[i].eightyPlus.toString()
                        : '-'),
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: context.read<TopCubit>().state.value3))),
      ));
    }

    return l;
  }

  List<Widget> createThrowsC3(List<Finish> finishes) {
    List<Widget> l = [];
    for (int i = 0; i < finishes.length; i++) {
      l.add(Expanded(
        child: Center(
            child: Text(
                (scores171
                    ? (finishes[i].ninetyOneplus != -1.0)
                        ? finishes[i].ninetyOneplus.toString()
                        : '-'
                    : (finishes[i].hundretPlus != -1.0)
                        ? finishes[i].hundretPlus.toString()
                        : '-'),
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: context.read<TopCubit>().state.value3))),
      ));
    }

    return l;
  }

  List<Widget> createThrowsC4(List<Finish> finishes) {
    List<Widget> l = [];
    for (int i = 0; i < finishes.length; i++) {
      l.add(Expanded(
        child: Center(
            child: Text(
                (scores171
                    ? (finishes[i].hundretThirtyOneplus != -1.0)
                        ? finishes[i].hundretThirtyOneplus.toString()
                        : '-'
                    : (finishes[i].hundretFortyPlus != -1.0)
                        ? finishes[i].hundretFortyPlus.toString()
                        : '-'),
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: context.read<TopCubit>().state.value3))),
      ));
    }

    return l;
  }

  List<Widget> createThrowsC5(List<Finish> finishes) {
    List<Widget> l = [];
    for (int i = 0; i < finishes.length; i++) {
      l.add(Expanded(
        child: Center(
            child: Text(
                (scores171
                    ? (finishes[i].hundretSeventyOneplus != -1.0)
                        ? finishes[i].hundretSeventyOneplus.toString()
                        : '-'
                    : (finishes[i].hundretEighty != -1.0)
                        ? finishes[i].hundretEighty.toString()
                        : '-'),
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: context.read<TopCubit>().state.value3))),
      ));
    }

    return l;
  }

  List<Widget> createNineDartsNeeded(List<Finish> finishes) {
    List<Widget> l = [];
    for (int i = 0; i < finishes.length; i++) {
      l.add(Expanded(
        child: Center(
            child: Text(
                (scores171
                    ? (finishes[i].nineDartsNeeded != -1.0)
                        ? finishes[i].nineDartsNeeded.toString()
                        : '-'
                    : (finishes[i].nineDartsNeeded != -1.0)
                        ? finishes[i].nineDartsNeeded.toString()
                        : '-'),
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: context.read<TopCubit>().state.value3))),
      ));
    }

    return l;
  }

  List<Widget> createTenToTwelveDartsNeeded(List<Finish> finishes) {
    List<Widget> l = [];
    for (int i = 0; i < finishes.length; i++) {
      l.add(Expanded(
        child: Center(
            child: Text(
                (scores171
                    ? (finishes[i].tenToTwelveDartsNeeded != -1.0)
                        ? finishes[i].tenToTwelveDartsNeeded.toString()
                        : '-'
                    : (finishes[i].tenToTwelveDartsNeeded != -1.0)
                        ? finishes[i].tenToTwelveDartsNeeded.toString()
                        : '-'),
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: context.read<TopCubit>().state.value3))),
      ));
    }

    return l;
  }

  List<Widget> createThirteenToFifteenDartsNeeded(List<Finish> finishes) {
    List<Widget> l = [];
    for (int i = 0; i < finishes.length; i++) {
      l.add(Expanded(
        child: Center(
            child: Text(
                (scores171
                    ? (finishes[i].thirtheenToFifteenDartsNeeded != -1.0)
                        ? finishes[i].thirtheenToFifteenDartsNeeded.toString()
                        : '-'
                    : (finishes[i].thirtheenToFifteenDartsNeeded != -1.0)
                        ? finishes[i].thirtheenToFifteenDartsNeeded.toString()
                        : '-'),
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: context.read<TopCubit>().state.value3))),
      ));
    }

    return l;
  }

  List<Widget> createSixteenToEighteenDartsNeeded(List<Finish> finishes) {
    List<Widget> l = [];
    for (int i = 0; i < finishes.length; i++) {
      l.add(Expanded(
        child: Center(
            child: Text(
                (scores171
                    ? (finishes[i].sixteenToEighteenDartsNeeded != -1.0)
                        ? finishes[i].sixteenToEighteenDartsNeeded.toString()
                        : '-'
                    : (finishes[i].sixteenToEighteenDartsNeeded != -1.0)
                        ? finishes[i].sixteenToEighteenDartsNeeded.toString()
                        : '-'),
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: context.read<TopCubit>().state.value3))),
      ));
    }

    return l;
  }

  List<Widget> createNineteenToTwentyOneDartsNeeded(List<Finish> finishes) {
    List<Widget> l = [];
    for (int i = 0; i < finishes.length; i++) {
      l.add(Expanded(
        child: Center(
            child: Text(
                (scores171
                    ? (finishes[i].nineteenToTwentyOneDartsNeeded != -1.0)
                        ? finishes[i].nineteenToTwentyOneDartsNeeded.toString()
                        : '-'
                    : (finishes[i].nineteenToTwentyOneDartsNeeded != -1.0)
                        ? finishes[i].nineteenToTwentyOneDartsNeeded.toString()
                        : '-'),
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: context.read<TopCubit>().state.value3))),
      ));
    }

    return l;
  }

  List<Widget> createTwentyTwoToTwentyFourDartsNeeded(List<Finish> finishes) {
    List<Widget> l = [];
    for (int i = 0; i < finishes.length; i++) {
      l.add(Expanded(
        child: Center(
            child: Text(
                (scores171
                    ? (finishes[i].twentyTwoToTwentyFourDartsNeeded != -1.0)
                        ? finishes[i]
                            .twentyTwoToTwentyFourDartsNeeded
                            .toString()
                        : '-'
                    : (finishes[i].twentyTwoToTwentyFourDartsNeeded != -1.0)
                        ? finishes[i]
                            .twentyTwoToTwentyFourDartsNeeded
                            .toString()
                        : '-'),
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: context.read<TopCubit>().state.value3))),
      ));
    }

    return l;
  }

  List<Widget> createTwentyFiveToTwentySevenDartsNeeded(List<Finish> finishes) {
    List<Widget> l = [];
    for (int i = 0; i < finishes.length; i++) {
      l.add(Expanded(
        child: Center(
            child: Text(
                (scores171
                    ? (finishes[i].twentyFiveToTwentySevenDartsNeeded != -1.0)
                        ? finishes[i]
                            .twentyFiveToTwentySevenDartsNeeded
                            .toString()
                        : '-'
                    : (finishes[i].twentyFiveToTwentySevenDartsNeeded != -1.0)
                        ? finishes[i]
                            .twentyFiveToTwentySevenDartsNeeded
                            .toString()
                        : '-'),
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: context.read<TopCubit>().state.value3))),
      ));
    }

    return l;
  }

  List<Widget> createTwentyEightToThirtyDartsNeeded(List<Finish> finishes) {
    List<Widget> l = [];
    for (int i = 0; i < finishes.length; i++) {
      l.add(Expanded(
        child: Center(
            child: Text(
                (scores171
                    ? (finishes[i].twentyEightToThirtyDartsNeeded != -1.0)
                        ? finishes[i].twentyEightToThirtyDartsNeeded.toString()
                        : '-'
                    : (finishes[i].twentyEightToThirtyDartsNeeded != -1.0)
                        ? finishes[i].twentyEightToThirtyDartsNeeded.toString()
                        : '-'),
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: context.read<TopCubit>().state.value3))),
      ));
    }

    return l;
  }

  List<Widget> createThirtyOnePlusDartsNeeded(List<Finish> finishes) {
    List<Widget> l = [];
    for (int i = 0; i < finishes.length; i++) {
      l.add(Expanded(
        child: Center(
            child: Text(
                (scores171
                    ? (finishes[i].thirtyOnePlusDartsNeeded != -1.0)
                        ? finishes[i].thirtyOnePlusDartsNeeded.toString()
                        : '-'
                    : (finishes[i].thirtyOnePlusDartsNeeded != -1.0)
                        ? finishes[i].thirtyOnePlusDartsNeeded.toString()
                        : '-'),
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: context.read<TopCubit>().state.value3))),
      ));
    }

    return l;
  }

  List<Widget> createWonLegsPerSet(List<Finish> finishes) {
    List<Widget> l = [];
    for (int i = 0; i < finishes.length; i++) {
      l.add(Expanded(
        child: Center(
            child: Text(
                (scores171
                    ? (finishes[i].wonLegsInSet == -1.0)
                        ? finishes[i].wonLegsInSet.toString()
                        : '-'
                    : (finishes[i].wonLegsInSet != -1.0)
                        ? finishes[i].wonLegsInSet.toString()
                        : '-'),
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: context.read<TopCubit>().state.value3))),
      ));
    }

    return l;
  }
}
