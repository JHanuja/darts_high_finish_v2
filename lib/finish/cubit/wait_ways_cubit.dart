import 'dart:async';

import 'package:bloc/bloc.dart';

class WaitWaysCubit extends Cubit<int> {
  WaitWaysCubit() : super(0);

  late Timer t;
  late Timer k;

  bool tInitialized = false;
  bool kInitialized = false;

  void startTimer() {
    emit(0);
    tInitialized = true;
    t = Timer(const Duration(seconds: 5), () {
      
      emit(1);
      kInitialized = true;
      k = Timer(const Duration(seconds: 10), () {
        
        emit(2);
      });
    });
  }

  @override
  Future<void> close() {
    if (tInitialized) {
      t.cancel();
    }
    if (kInitialized) {
      k.cancel();
    }
    return super.close();
  }
}
