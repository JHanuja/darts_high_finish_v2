import 'package:darts_high_finish_v2/bloc_observer.dart';
import 'package:darts_high_finish_v2/splash/view/splash_view.dart';
import 'package:darts_high_finish_v2/theme/cubit/theme_cubit.dart';
import 'package:darts_high_finish_v2/top/cubit/top_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = CompleteAppBlocObserver();
  runApp(MyApp(child: SplashView()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final Widget child;

  const MyApp({required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => TopCubit(),
      ),
      BlocProvider(
        create: (_) => ThemeCubit(),
      ),
    ], child: AppContent(child: child));
  }
}

class AppContent extends StatelessWidget {
  final Widget child;

  const AppContent({required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          theme: state.themeData,
          home: child,
        );
      },
    );
  }
}
