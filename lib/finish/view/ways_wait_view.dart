import 'package:darts_high_finish_v2/finish/bloc/finish_bloc.dart';
import 'package:darts_high_finish_v2/finish/cubit/wait_ways_cubit.dart';
import 'package:darts_high_finish_v2/finish/view/keyboard_view.dart';
import 'package:darts_high_finish_v2/finish/view/wait_view.dart';
import 'package:darts_high_finish_v2/finish/view/ways_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class WaysWait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaitWaysCubit, int>(
      bloc: context.read<FinishBloc>().activeWaitWaysCubit,
      builder: (context, state) {
        switch (state) {
          case 0:
            return Wait();
          case 1:
            return Ways();
          case 2:
            return Keyboard();
        }
        return Container();
      },
    );
  }
}
