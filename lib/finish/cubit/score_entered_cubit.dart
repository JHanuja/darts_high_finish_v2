import 'package:bloc/bloc.dart';


class ScoreEnteredCubit extends Cubit<String> {
  ScoreEnteredCubit() : super("");

  void append1() => emit(state + "1");
  void append2() => emit(state + "2");
  void append3() => emit(state + "3");
  void append4() => emit(state + "4");
  void append5() => emit(state + "5");
  void append6() => emit(state + "6");
  void append7() => emit(state + "7");
  void append8() => emit(state + "8");
  void append9() => emit(state + "9");
  void append0() => emit(state + "0");
  void clear() => emit("");
}
