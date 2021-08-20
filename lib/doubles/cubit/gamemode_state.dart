part of 'gamemode_cubit.dart';

abstract class GamemodeState extends Equatable {
  const GamemodeState();

  @override
  List<Object> get props => [];
}

class GamemodeInitial extends GamemodeState {
  const GamemodeInitial() : super();
}

class Gamemode100to170 extends GamemodeState {
  const Gamemode100to170() : super();
}

class Gamemode170to301 extends GamemodeState {
  const Gamemode170to301() : super();
}

class Gamemode301 extends GamemodeState {
  const Gamemode301() : super();
}

class Gamemode501 extends GamemodeState {
  const Gamemode501() : super();
}
