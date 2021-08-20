import 'package:darts_high_finish_v2/top/cubit/top_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopView extends StatelessWidget {
  final Widget child;

  TopView({required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
           if (!context.read<TopCubit>().allValuesAreSet()) {
             double width = MediaQuery.of(context).size.width;
             context.read<TopCubit>().updateSafeAreaHeight(constraints.maxHeight);
             context.read<TopCubit>().updateValues(width);
            }
          return child;
        },
      ),
    );
  }
}
