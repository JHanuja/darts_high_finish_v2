import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'finish_event.dart';
part 'finish_state.dart';

class FinishBloc extends Bloc<FinishEvent, FinishState> {
  FinishBloc() : super(FinishInitial());

  @override
  Stream<FinishState> mapEventToState(
    FinishEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
