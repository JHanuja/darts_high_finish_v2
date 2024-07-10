import 'package:darts_high_finish_v2/finish/bloc/finish_bloc.dart';
import 'package:darts_high_finish_v2/theme/cubit/theme_cubit.dart';
import 'package:darts_high_finish_v2/top/cubit/top_cubit.dart';
import 'package:darts_high_finish_v2/x01GameProperties/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Score extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FinishBloc, FinishState>(
      builder: (context, state) {
        return Container(
          color: Theme.of(context).primaryColor,
          height: context.read<TopCubit>().state.safeAreaHeight * 0.2,
          child: Row(
            children: createScores(context.read<FinishBloc>().players, context)
            ,
          ),
        );
      },
    );
  }

  List<Widget> createScores(List<Player> players, BuildContext context) {
    List<Widget> l = [];

    if (players.length <= 2) {
      for (int i = 0; i < players.length; i++) {
        l.add(
          Expanded(
            child: Container(
              child: Center(
                  child: Text(
                
                    context
                        .read<FinishBloc>()
                        .finishes[i]
                        .score
                        .toString() 
                    ,
               style: TextStyle(
                      color: Theme.of(context).primaryColorDark,
                      fontWeight: FontWeight.bold,
                      fontSize: context.read<TopCubit>().state.value4 * 2),
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
