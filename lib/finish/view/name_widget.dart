import 'package:darts_high_finish_v2/finish/bloc/finish_bloc.dart';
import 'package:darts_high_finish_v2/top/cubit/top_cubit.dart';
import 'package:darts_high_finish_v2/x01GameProperties/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TopCubit topCubit = context.read<TopCubit>();
    return BlocBuilder<FinishBloc, FinishState>(
      builder: (context, state) {
        return Container(
            height: topCubit.state.safeAreaHeight * 0.08,
            color: Theme.of(context).backgroundColor,
            child: Row(
              children:
                  createNames(context.read<FinishBloc>().players, context),
            ));
      },
    );
  }

  List<Widget> createNames(List<Player> players, BuildContext context) {
    List<Widget> l = [];

    if (players.length <= 2) {
      for (int i = 0; i < players.length; i++) {
        l.add(
          Expanded(
            child: Container(
              child: Center(
                  child: Text(
                players[i].name +
                    '(' +
                    context
                        .read<FinishBloc>()
                        .finishes[i]
                        .dartsNeededForLeg
                        .toString() +
                    ')',
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontWeight: FontWeight.bold),
              )),
            ),
          ),
        );
        if (i == 0 && players.length > 1) {
          l.add(Container(
            color: Theme.of(context).hoverColor,
            width: 2.0,
          ));
        }
      }
    }

    return l;
  }
}
