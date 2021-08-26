import 'package:darts_high_finish_v2/finish/bloc/finish_bloc.dart';
import 'package:darts_high_finish_v2/finish/view/wait_view.dart';
import 'package:darts_high_finish_v2/top/cubit/top_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'helper.dart';

extension on WidgetTester {
  Future<void> pumpWidgetWithTopCubitFinishBloc(
      TopCubit topCubit, FinishBloc finishBloc, Widget child) {
    return pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider.value(
            value: topCubit,
            child: BlocProvider.value(value: finishBloc, child: child),
          ),
        ),
      ),
    );
  }
}



void main() {
  late FinishBloc finishBloc;
  late TopCubit topCubit;

  setUpAll(() {
    registerFallbackValue<FinishState>(FakeFinishState());
    registerFallbackValue<FinishEvent>(FakeFinishEvent());
    registerFallbackValue<TopState>(FakeTopState());
    registerFallbackValue<TopCubit>(TopCubit());

  });

  setUp(() {
    finishBloc = MockFinishBloc();
    topCubit = MockTopCubit();
  });

  group('Wait View Rendered', () {
    testWidgets(
      "Wait View Rendered",
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
        await tester.pumpWidgetWithTopCubitFinishBloc(
            topCubit, finishBloc, Wait());
        expect(find.byType(Container), findsOneWidget);
      },
    );
  });
}