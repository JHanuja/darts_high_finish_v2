import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'doubles_state.dart';

class DoublesCubit extends Cubit<DoublesState> {
  DoublesCubit() : super(DoublesInitial());
}
