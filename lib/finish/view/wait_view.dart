import 'package:darts_high_finish_v2/top/cubit/top_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.read<TopCubit>().state.safeAreaHeight * 0.7,
        color: Theme.of(context).primaryColorDark);
  }
}