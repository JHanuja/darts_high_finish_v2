import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'doubles_state.dart';

class DoublesCubit extends Cubit<DoublesState> {
  DoublesCubit() : super(DoublesState());

  void chooseDouble({int? d1, int? d2}) => emit(state.copyWith(d1: d1, d2: d2));
}
