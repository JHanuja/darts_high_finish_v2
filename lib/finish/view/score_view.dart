import 'package:darts_high_finish_v2/finish/bloc/finish_bloc.dart';
import 'package:darts_high_finish_v2/top/cubit/top_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Score extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FinishBloc, FinishState>(
      builder: (context, state) {
        return Container(
          height: context.read<TopCubit>().state.safeAreaHeight * 0.2,
          child: Center(
            child: Text(
              state.score.toString(),
              style: TextStyle(
                  fontSize: context.read<TopCubit>().state.value4 * 2),
            ),
          ),
        );
      },
    );
  }
}