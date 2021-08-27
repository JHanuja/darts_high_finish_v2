import 'package:darts_high_finish_v2/doubles/cubit/doubles_cubit.dart';
import 'package:darts_high_finish_v2/doubles/cubit/gamemode_cubit.dart';
import 'package:darts_high_finish_v2/finish/view/finish_view.dart';
import 'package:darts_high_finish_v2/top/cubit/top_cubit.dart';
import 'package:darts_high_finish_v2/top/view/top_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoublesPage extends StatelessWidget {
  const DoublesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GamemodeCubit>(
          create: (BuildContext context) => GamemodeCubit(),
        ),
        BlocProvider<DoublesCubit>(
          create: (BuildContext context) => DoublesCubit(),
        ),
      ],
      child: DoublesView(),
    );
  }
}

class DoublesView extends StatelessWidget {
  const DoublesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TopView(
      child: Scaffold(
        body: Container(
          color: Theme.of(context).primaryColor,
          child: Column(
            children: [
              Container(
                height: context.read<TopCubit>().state.safeAreaHeight * 0.6,
                child: Row(
                  children: [
                    Expanded(
                        child: DoubleButtonGroup(
                      buttonGroup: true,
                    )),
                    Expanded(
                        child: DoubleButtonGroup(
                      buttonGroup: false,
                    ))
                  ],
                ),
              ),
              Container(
                height: context.read<TopCubit>().state.safeAreaHeight * 0.2,
                //color: Colors.red,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.read<TopCubit>().state.value4),
                  child: GameMode(),
                ),
              ),
              Expanded(
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if ((context.read<GamemodeCubit>().state
                              is! GamemodeInitial) &&
                          context.read<DoublesCubit>().choosen()) {
                        int d1 = context.read<DoublesCubit>().state.d1;
                        int d2 = context.read<DoublesCubit>().state.d2;
                        GamemodeState gameMode =
                            context.read<GamemodeCubit>().state;
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return FinishView(
                            d1: d1,
                            d2: d2,
                            gameMode: gameMode,
                          );
                        }));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Theme.of(context).backgroundColor,
                          content: Text(
                            "Please select two Doubles and Game Mode",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ));
                      }
                    },
                    child: Text(
                      'Game On',
                      style: TextStyle(
                          color: Theme.of(context).cardColor,
                          fontSize:
                              context.read<TopCubit>().state.value3 * 1.5),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Theme.of(context).focusColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DoubleButtonGroup extends StatelessWidget {
  final bool buttonGroup;

  const DoubleButtonGroup({Key? key, required this.buttonGroup})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoublesCubit, DoublesState>(builder: (context, state) {
      return Column(
        children: [
          SizedBox(
              height: context.read<TopCubit>().state.safeAreaHeight * 0.05),
          ElevatedButton(
            onPressed: () {
              buttonGroup
                  ? context.read<DoublesCubit>().chooseDouble(d1: 20)
                  : context.read<DoublesCubit>().chooseDouble(d2: 20);
            },
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(fontSize: context.read<TopCubit>().state.value3)),
              backgroundColor: (state.d1 == 20 && buttonGroup)
                  ? MaterialStateProperty.all<Color>(
                      Theme.of(context).focusColor)
                  : (state.d2 == 20 && !buttonGroup)
                      ? MaterialStateProperty.all<Color>(
                          Theme.of(context).focusColor)
                      : MaterialStateProperty.all<Color>(
                          Theme.of(context).backgroundColor),
            ),
            child: Text('D20',
                style: TextStyle(color: Theme.of(context).cardColor)),
          ),
          SizedBox(
              height: context.read<TopCubit>().state.safeAreaHeight * 0.03),
          ElevatedButton(
            onPressed: () {
              buttonGroup
                  ? context.read<DoublesCubit>().chooseDouble(d1: 18)
                  : context.read<DoublesCubit>().chooseDouble(d2: 18);
            },
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(fontSize: context.read<TopCubit>().state.value3)),
              backgroundColor: (state.d1 == 18 && buttonGroup)
                  ? MaterialStateProperty.all<Color>(
                      Theme.of(context).focusColor)
                  : (state.d2 == 18 && !buttonGroup)
                      ? MaterialStateProperty.all<Color>(
                          Theme.of(context).focusColor)
                      : MaterialStateProperty.all<Color>(
                          Theme.of(context).backgroundColor),
            ),
            child: Text('D18',
                style: TextStyle(color: Theme.of(context).cardColor)),
          ),
          SizedBox(
              height: context.read<TopCubit>().state.safeAreaHeight * 0.03),
          ElevatedButton(
            onPressed: () {
              buttonGroup
                  ? context.read<DoublesCubit>().chooseDouble(d1: 16)
                  : context.read<DoublesCubit>().chooseDouble(d2: 16);
            },
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(fontSize: context.read<TopCubit>().state.value3)),
              backgroundColor: (state.d1 == 16 && buttonGroup)
                  ? MaterialStateProperty.all<Color>(
                      Theme.of(context).focusColor)
                  : (state.d2 == 16 && !buttonGroup)
                      ? MaterialStateProperty.all<Color>(
                          Theme.of(context).focusColor)
                      : MaterialStateProperty.all<Color>(
                          Theme.of(context).backgroundColor),
            ),
            child: Text('D16',
                style: TextStyle(color: Theme.of(context).cardColor)),
          ),
          SizedBox(
              height: context.read<TopCubit>().state.safeAreaHeight * 0.03),
          ElevatedButton(
            onPressed: () {
              buttonGroup
                  ? context.read<DoublesCubit>().chooseDouble(d1: 14)
                  : context.read<DoublesCubit>().chooseDouble(d2: 14);
            },
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(fontSize: context.read<TopCubit>().state.value3)),
              backgroundColor: (state.d1 == 14 && buttonGroup)
                  ? MaterialStateProperty.all<Color>(
                      Theme.of(context).focusColor)
                  : (state.d2 == 14 && !buttonGroup)
                      ? MaterialStateProperty.all<Color>(
                          Theme.of(context).focusColor)
                      : MaterialStateProperty.all<Color>(
                          Theme.of(context).backgroundColor),
            ),
            child: Text('D14',
                style: TextStyle(color: Theme.of(context).cardColor)),
          ),
          SizedBox(
              height: context.read<TopCubit>().state.safeAreaHeight * 0.03),
          ElevatedButton(
            onPressed: () {
              buttonGroup
                  ? context.read<DoublesCubit>().chooseDouble(d1: 12)
                  : context.read<DoublesCubit>().chooseDouble(d2: 12);
            },
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(fontSize: context.read<TopCubit>().state.value3)),
              backgroundColor: (state.d1 == 12 && buttonGroup)
                  ? MaterialStateProperty.all<Color>(
                      Theme.of(context).focusColor)
                  : (state.d2 == 12 && !buttonGroup)
                      ? MaterialStateProperty.all<Color>(
                          Theme.of(context).focusColor)
                      : MaterialStateProperty.all<Color>(
                          Theme.of(context).backgroundColor),
            ),
            child: Text('D12',
                style: TextStyle(color: Theme.of(context).cardColor)),
          ),
        ],
      );
    });
  }
}

class GameMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GamemodeCubit, GamemodeState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          context.read<GamemodeCubit>().chooseGameMode(1);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0)),
                            color: state is Gamemode100to170
                                ? Theme.of(context).focusColor
                                : Theme.of(context).backgroundColor,
                          ),
                          child: Center(
                            child: Text(
                              '100-170',
                              style: TextStyle(
                                  color: Theme.of(context).cardColor,
                                  fontSize:
                                      context.read<TopCubit>().state.value3),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          context.read<GamemodeCubit>().chooseGameMode(3);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0)),
                            color: state is Gamemode301
                                ? Theme.of(context).focusColor
                                : Theme.of(context).backgroundColor,
                          ),
                          child: Center(
                            child: Text(
                              '301',
                              style: TextStyle(
                                  color: Theme.of(context).cardColor,
                                  fontSize:
                                      context.read<TopCubit>().state.value3),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          context.read<GamemodeCubit>().chooseGameMode(2);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0)),
                            color: state is Gamemode170to301
                                ? Theme.of(context).focusColor
                                : Theme.of(context).backgroundColor,
                          ),
                          child: Center(
                            child: Text(
                              '170-301',
                              style: TextStyle(
                                  color: Theme.of(context).cardColor,
                                  fontSize:
                                      context.read<TopCubit>().state.value3),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          context.read<GamemodeCubit>().chooseGameMode(4);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10.0)),
                            color: state is Gamemode501
                                ? Theme.of(context).focusColor
                                : Theme.of(context).backgroundColor,
                          ),
                          child: Center(
                            child: Text(
                              '501',
                              style: TextStyle(
                                  color: Theme.of(context).cardColor,
                                  fontSize:
                                      context.read<TopCubit>().state.value3),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
