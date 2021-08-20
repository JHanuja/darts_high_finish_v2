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
        body: Column(
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
                      GamemodeState gameMode = context.read<GamemodeCubit>().state;
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return FinishView(
                          d1:d1,
                          d2:d2,
                          gameMode: gameMode,
                        );
                      }));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.green,
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
                        fontSize: context.read<TopCubit>().state.value3 * 1.5),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.indigo)),
                ),
              ),
            ),
          ],
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
                  ? MaterialStateProperty.all<Color>(Colors.orange)
                  : (state.d2 == 20 && !buttonGroup)
                      ? MaterialStateProperty.all<Color>(Colors.orange)
                      : MaterialStateProperty.all<Color>(Colors.green),
            ),
            child: Text('D20'),
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
                  ? MaterialStateProperty.all<Color>(Colors.orange)
                  : (state.d2 == 18 && !buttonGroup)
                      ? MaterialStateProperty.all<Color>(Colors.orange)
                      : MaterialStateProperty.all<Color>(Colors.green),
            ),
            child: Text('D18'),
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
                  ? MaterialStateProperty.all<Color>(Colors.orange)
                  : (state.d2 == 16 && !buttonGroup)
                      ? MaterialStateProperty.all<Color>(Colors.orange)
                      : MaterialStateProperty.all<Color>(Colors.green),
            ),
            child: Text('D16'),
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
                  ? MaterialStateProperty.all<Color>(Colors.orange)
                  : (state.d2 == 14 && !buttonGroup)
                      ? MaterialStateProperty.all<Color>(Colors.orange)
                      : MaterialStateProperty.all<Color>(Colors.green),
            ),
            child: Text('D14'),
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
                  ? MaterialStateProperty.all<Color>(Colors.orange)
                  : (state.d2 == 12 && !buttonGroup)
                      ? MaterialStateProperty.all<Color>(Colors.orange)
                      : MaterialStateProperty.all<Color>(Colors.green),
            ),
            child: Text('D12'),
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
        return Row(
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
                        color: state is Gamemode100to170
                            ? Colors.orange
                            : Colors.green,
                        child: Center(
                          child: Text(
                            '100-170',
                            style: TextStyle(
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
                        color:
                            state is Gamemode301 ? Colors.orange : Colors.green,
                        child: Center(
                          child: Text(
                            '301',
                            style: TextStyle(
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
                        color: state is Gamemode170to301
                            ? Colors.orange
                            : Colors.green,
                        child: Center(
                          child: Text(
                            '170-301',
                            style: TextStyle(
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
                        color:
                            state is Gamemode501 ? Colors.orange : Colors.green,
                        child: Center(
                          child: Text(
                            '501',
                            style: TextStyle(
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
        );
      },
    );
  }
}
