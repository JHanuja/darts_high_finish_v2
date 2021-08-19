import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  late Timer t;

  SplashCubit() : super(SplashInitial());

  void startTimer() {
    t = Timer(const Duration(seconds: 3), () {
      emit(SplashFinished());
    });
    
  }

  @override
  Future<void> close() {
    t.cancel();
    return super.close();
  }
}
