import 'package:darts_high_finish_v2/bloc_observer.dart';
import 'package:darts_high_finish_v2/splash/view/splash_view.dart';
import 'package:darts_high_finish_v2/top/cubit/top_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = CompleteAppBlocObserver();
  runApp(MyApp(child:SplashView()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final Widget child;

  const MyApp({required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TopCubit(),
      child: MaterialApp(
        theme: ThemeData(brightness: Brightness.dark, fontFamily: 'DoHyeon'),
        home: child,
      ),
    );
  }
}
