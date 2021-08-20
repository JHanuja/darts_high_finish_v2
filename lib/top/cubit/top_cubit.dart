import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'top_state.dart';

class TopCubit extends Cubit<TopState> {
  TopCubit() : super(TopState());

  void updateSafeAreaHeight(double safeAreaHeight) => emit (state.copyWith(safeAreaHeight: safeAreaHeight));
  void updateValues(double width) => emit (state.copyWith(width: width,value1: width * 0.022,value2: width * 0.033,value3: width *0.044,value4: width * 0.088));
  
  bool allValuesAreSet() =>  ((state.safeAreaHeight != 0.0) && (state.width != 0.0) && (state.value1 != 0.0) &&(state.value2 != 0.0) &&(state.value3 != 0.0) &&(state.value4 != 0.0));
}
