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
            color: Colors.black26,
            height: context.read<TopCubit>().state.safeAreaHeight * 0.8,
            width: context.read<TopCubit>().state.width,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.all(context.read<TopCubit>().state.width * 0.05),
                    child: Container(
                      color: Colors.amber,
                      child: Center(
                        child: Text(
                          (state as FinishInRange).standartWay,
                          style: TextStyle(
                              fontSize: context.read<TopCubit>().state.value4),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.all(context.read<TopCubit>().state.width * 0.05),
                    child: Container(
                      color: Colors.purple,
                      child: Center(
                        child: Text(
                          state.waysD1.isNotEmpty ? state.waysD1[0] : "",
                          style: TextStyle(
                              fontSize: context.read<TopCubit>().state.value4),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.all(context.read<TopCubit>().state.width * 0.05),
                    child: Container(
                      color:Colors.purple,
                      child: Center(
                        child: Text(
                          state.waysD1.length > 1 ? state.waysD1[1] : "",
                          style: TextStyle(
                              fontSize: context.read<TopCubit>().state.value4),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.all(context.read<TopCubit>().state.width * 0.05),
                    child: Container(
                      color: Colors.cyan,
                      child: Center(
                        child: Text(
                          state.waysD2.isNotEmpty ? state.waysD2[0] : "",
                          style: TextStyle(
                              fontSize: context.read<TopCubit>().state.value4),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.all(context.read<TopCubit>().state.width * 0.05),
                    child: Container(
                      color:Colors.cyan,
                      child: Center(
                        child: Text(
                          state.waysD2.length > 1 ? state.waysD2[1] : "",
                          style: TextStyle(
                              fontSize: context.read<TopCubit>().state.value4),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
