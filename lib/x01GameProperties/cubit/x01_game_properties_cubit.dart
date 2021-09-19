import 'package:bloc/bloc.dart';
import 'package:darts_high_finish_v2/x01GameProperties/player.dart';
import 'package:darts_high_finish_v2/x01GameProperties/view/x01_game_properties.dart';
import 'package:equatable/equatable.dart';

part 'x01_game_properties_state.dart';

class X01GamePropertiesCubit extends Cubit<X01GamePropertiesState> {
  X01GamePropertiesCubit() : super(X01GamePropertiesState());

  void removePlayer(Player player) =>
      emit(state.copyWith(deletedPlayer: player));
  void addPlayer(Player player) => emit(state.copyWith(player: player));
  void setMode(String mode) => emit(state.copyWith(mode: mode));
  void setSetLegMode(bool mode) => emit(state.copyWith(setLegMode: mode));
  void setLegsPerSet(int legs) => emit(state.copyWith(legsPerSet: legs));
  void setLengthMode(String mode) => emit(state.copyWith(lengthMode: mode));
  void incrementMatchLength() =>
      emit(state.copyWith(matchLength: state.matchLength + 1));
  void decrementMatchLength() =>
      emit(state.copyWith(matchLength: state.matchLength - 1));
  void modifyPlayer() => emit(state.copyWith(modified: true));
}
