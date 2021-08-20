import 'package:darts_high_finish_v2/doubles/view/doubles_view.dart';
import 'package:darts_high_finish_v2/splash/cubit/splash_cubit.dart';
import 'package:darts_high_finish_v2/top/cubit/top_cubit.dart';
import 'package:darts_high_finish_v2/top/view/top_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late SplashCubit _splashCubit;

  @override
  void initState() {
    _splashCubit = SplashCubit();
    _splashCubit.startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _splashCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(context.read<TopCubit>().state.value4);
    return TopView(
      child: Scaffold(
        body: BlocListener(
          child: Center(
            //needs BlocBuilder because initial TopState has 0.0 as values
            //and in the TopView the child is final and does not get rebuild.
            //After the first widget it's not necessary anymore because the 
            //values are set
            child: BlocBuilder<TopCubit, TopState>(     
              builder: (context, state) {
                return Text(
                  'Darts High Finish',
                  style: TextStyle(
                      fontSize: context.read<TopCubit>().state.value4),
                );
              },
            ),
          ),
          bloc: _splashCubit,
          listener: (BuildContext context, SplashState state) {
            if (state is SplashFinished) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return DoublesPage();
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
