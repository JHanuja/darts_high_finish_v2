import 'dart:async';

import 'package:bloc/bloc.dart';

class WaitWaysCubit extends Cubit<int> {
  final int durationWait;
  final int durationWays;
  final int active;

  WaitWaysCubit({required this.active})
      : durationWait = 2,
        durationWays = 2,
        super(active);

  late Timer t;
  late Timer k;

  bool tInitialized = false;
  bool kInitialized = false;

  Future<void> startTimer() async {
    if (active == 2) {
      emit(active);
      return;
    }
    emit(0);
    await Future.delayed(const Duration(seconds: 4));
    emit(1);
    await Future.delayed(const Duration(seconds: 6));
    emit(2);
    return;
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
