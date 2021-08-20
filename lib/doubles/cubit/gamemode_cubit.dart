import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'gamemode_state.dart';

class GamemodeCubit extends Cubit<GamemodeState> {
  GamemodeCubit() : super(GamemodeInitial());

  void chooseGameMode(int mode) {
    switch (mode) {
      case 1:
        emit(Gamemode100to170());
        break;
      case 2:
        emit(Gamemode170to301());
        break;
      case 3:
        emit(Gamemode301());
        break;
      case 4:
        emit(Gamemode501());
        break;
    }
    return;
  }
}
