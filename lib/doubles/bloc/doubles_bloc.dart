import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'doubles_event.dart';
part 'doubles_state.dart';

class DoublesBloc extends Bloc<DoublesEvent, DoublesState> {
  DoublesBloc() : super(DoublesInitial());

  @override
  Stream<DoublesState> mapEventToState(
    DoublesEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
