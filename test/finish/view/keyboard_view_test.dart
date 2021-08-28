import 'package:darts_high_finish_v2/finish/bloc/finish_bloc.dart';
import 'package:darts_high_finish_v2/finish/view/keyboard_view.dart';
import 'package:darts_high_finish_v2/theme/cubit/theme_cubit.dart';
import 'package:darts_high_finish_v2/top/cubit/top_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'helper.dart';

extension on WidgetTester {
  Future<void> pumpWidgetWithTopCubitFinishBloc(TopCubit topCubit,
      FinishBloc finishBloc, ThemeCubit themeCubit, Widget child) {
    return pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider.value(
            value: topCubit,
            child: BlocProvider.value(
              value: themeCubit,
              child: BlocProvider.value(value: finishBloc, child: child),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  late FinishBloc finishBloc;
  late TopCubit topCubit;
  late ThemeCubit themeCubit;

  setUpAll(() {
    registerFallbackValue<FinishState>(FakeFinishState());
    registerFallbackValue<FinishEvent>(FakeFinishEvent());
    registerFallbackValue<TopState>(FakeTopState());
    registerFallbackValue<TopCubit>(TopCubit());
    registerFallbackValue<ThemeCubit>(ThemeCubit());
    registerFallbackValue<ThemeState>(LightTheme());

  });

  setUp(() {
    finishBloc = MockFinishBloc();
    topCubit = MockTopCubit();
    themeCubit = MockThemeCubit();
  });

  group('Keyboard View Rendered', () {
    testWidgets(
      "KeyboardView Rendered",
      (WidgetTester tester) async {
        when(() => finishBloc.state).thenReturn(FinishOutOfRange(
            score: 100,
            error: false,
            average: 100.0,
            dartsNeeded: 3,
            scoreEntered: 100));
        when(() => topCubit.state).thenReturn(TopState(
            safeAreaHeight: 700,
            width: 300,
            value1: 5.0,
            value2: 5.0,
            value3: 5.0,
            value4: 5.0));
        when(() => themeCubit.state).thenReturn(LightTheme());
        await tester.pumpWidgetWithTopCubitFinishBloc(
            topCubit, finishBloc, themeCubit,Keyboard());
        expect(find.text('Av Leg:  100.00'), findsOneWidget);
        expect(find.text('Av Match:  100.00'), findsOneWidget);
        expect(find.text('Darts Needed Leg:  3'), findsOneWidget);
        expect(find.byType(ScoreEnterer), findsOneWidget);
      },
    );
  });
}
