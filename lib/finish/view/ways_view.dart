import 'package:darts_high_finish_v2/finish/bloc/finish_bloc.dart';
import 'package:darts_high_finish_v2/top/cubit/top_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ways extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FinishBloc, FinishState>(
      builder: (context, state) {
        return Container(
          color: Theme.of(context).backgroundColor,
          height: context.read<TopCubit>().state.safeAreaHeight * 0.8,
          width: context.read<TopCubit>().state.width,
          child: Column(
            children: buildList(context, state),
          ),
        );
      },
    );
  }

  List<Widget> buildList(BuildContext context, FinishState state) {
    List<Widget> ways = [];

    FinishInRange f = state as FinishInRange;

    ways.add(buildWidget(context, f.standartWay));

    if (f.waysD1.isNotEmpty) {
      ways.add(buildWidget(context, f.waysD1[0]));
    }

    
    if (f.waysD2.isNotEmpty) {
      ways.add(buildWidget(context, f.waysD2[0]));
    }


    while (ways.length < 5) {
      ways.add(Expanded(
        child: Container(),
      ));
    }

    return ways;
  }

  Widget buildWidget(BuildContext context, String way) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(context.read<TopCubit>().state.width * 0.05),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              color: Theme.of(context).primaryColor),
          child: Center(
            child: Text(
              way,
              style: TextStyle(
                  color: Theme.of(context).backgroundColor,
                  fontSize: context.read<TopCubit>().state.value4),
            ),
          ),
        ),
      ),
    );
  }
}
