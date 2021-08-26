import 'package:darts_high_finish_v2/finish/bloc/finish_bloc.dart';
import 'package:darts_high_finish_v2/finish/view/keyboard_view.dart';
import 'package:darts_high_finish_v2/finish/view/ways_wait_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WaysWaitKeyboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FinishBloc, FinishState>(
      builder: (context, state) {
        if (state is FinishOutOfRange) {
          return Keyboard();
        } else if (state is FinishInRange) {
          FinishInRange f = state;
          if (f.error) {
            return Keyboard();
          } else {
            print('hsadfohjfaiodsa');
            return WaysWait();
          }
        } else {
          return Container();
        }
      },
    );
  }
}
