import 'package:bloc_test/bloc_test.dart';
import 'package:darts_high_finish_v2/finish/bloc/finish_bloc.dart';
import 'package:darts_high_finish_v2/finish/cubit/wait_ways_cubit.dart';
import 'package:darts_high_finish_v2/top/cubit/top_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

class MockFinishBloc extends MockBloc<FinishEvent, FinishState>
    implements FinishBloc {}

class FakeFinishState extends Fake implements FinishState {}

class FakeFinishEvent extends Fake implements FinishEvent {}

class MockTopCubit extends MockBloc<TopCubit, TopState> implements TopCubit {}

class FakeTopState extends Fake implements TopState {}

class MockWaitWaysCubit extends MockBloc<WaitWaysCubit,int> implements WaitWaysCubit{}

