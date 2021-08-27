import 'package:darts_high_finish_v2/doubles/cubit/gamemode_cubit.dart';
import 'package:darts_high_finish_v2/finish/bloc/finish_bloc.dart';
import 'package:darts_high_finish_v2/finish/cubit/wait_ways_cubit.dart';
import 'package:darts_high_finish_v2/finish/view/score_view.dart';
import 'package:darts_high_finish_v2/finish/view/ways_wait_keyboard_view.dart';
import 'package:darts_high_finish_v2/top/cubit/top_cubit.dart';
import 'package:darts_high_finish_v2/top/view/top_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinishView extends StatelessWidget {
  final int d1;
  final int d2;
  final GamemodeState gameMode;
  final WaitWaysCubit waitWaysCubit;

  FinishView({required this.d1, required this.d2, required this.gameMode})
      : waitWaysCubit = WaitWaysCubit();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FinishBloc(
              cubit: waitWaysCubit,
              d1: d1,
              d2: d2,
              gameMode: gameMode is Gamemode100to170
                  ? 1
                  : gameMode is Gamemode170to301
                      ? 2
                      : gameMode is Gamemode301
                          ? 3
                          : 4),
        ),
        BlocProvider(
          create: (context) => waitWaysCubit,
        ),
      ],
      child: TopView(child: FinishViewContent()),
    );
  }
}

class FinishViewContent extends StatefulWidget {
  @override
  _FinishViewContentState createState() => _FinishViewContentState();
}

class _FinishViewContentState extends State<FinishViewContent> {
  @override
  void initState() {
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
        children: [Score(), WaysWaitKeyboard()],
      ),
          )),
    );
  }
}
