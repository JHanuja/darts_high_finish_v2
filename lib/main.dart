import 'package:darts_high_finish_v2/splash/view/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'DoHyeon'),
      home: SplashView(),
    );
  }
}

