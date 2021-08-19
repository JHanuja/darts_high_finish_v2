import 'package:darts_high_finish_v2/doubles/view/doubles_view.dart';
import 'package:darts_high_finish_v2/splash/cubit/splash_cubit.dart';
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
    return Scaffold(
      body: BlocListener(
        child: Center(
          child: Text(
            'Darts High Finish',
            style: TextStyle(fontSize: 32.0),
          ),
        ),
        bloc: _splashCubit,
        listener: (BuildContext context, SplashState state) {
          if (state is SplashFinished) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) {
                  return DoublesView();
                },
              ),
            );
          }
        },
      ),
    );
  }
}
