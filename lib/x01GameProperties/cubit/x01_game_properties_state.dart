part of 'x01_game_properties_cubit.dart';

class X01GamePropertiesState extends Equatable {
  List<Player> players;
  String mode;
  bool setLegMode;
  int legsPerSet;
  String lengthMode;
  int matchLength;

  int modifiedPlayer;
  X01GamePropertiesState()
      : players = [],
        mode = '501',
        modifiedPlayer = 0,
        setLegMode = true,
        matchLength = 3,
        lengthMode = 'Unlimited',
        legsPerSet = 3;

  X01GamePropertiesState.fromValues(
      {required this.players,
      required this.mode,
      required this.setLegMode,
      required this.lengthMode,
      required this.matchLength,
      required this.modifiedPlayer,
      required this.legsPerSet});

  X01GamePropertiesState copyWith(
      {Player? player,
      Player? deletedPlayer,
      String? mode,
      bool? setLegMode,
      int? legsPerSet,
      int? matchLength,
      bool? modified,
      String? lengthMode}) {
    print('called');
    List<Player> actualPlayers = [];
    actualPlayers.addAll(players);
    if (player != null) {
      actualPlayers.add(player);
    }
    if (deletedPlayer != null) {
      actualPlayers.remove(deletedPlayer);
    }

    return X01GamePropertiesState.fromValues(
        players: actualPlayers,
        mode: mode ?? this.mode,
        setLegMode: setLegMode ?? this.setLegMode,
        legsPerSet: legsPerSet ?? this.legsPerSet,
        lengthMode: lengthMode ?? this.lengthMode,
        modifiedPlayer: (modified == null) ? modifiedPlayer : modifiedPlayer+1,
        matchLength: matchLength ?? this.matchLength);
  }

  @override
  List<Object> get props =>
      [players, mode, setLegMode, legsPerSet, lengthMode, matchLength,modifiedPlayer];

  int get numberOfPlayers => players.length;
  String get gameMode => mode;
}
