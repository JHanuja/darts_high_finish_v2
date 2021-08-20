import 'package:bloc_test/bloc_test.dart';
import 'package:darts_high_finish_v2/doubles/cubit/gamemode_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GamemodeCubit Test', () {
    test('GamemodeCubit initial State is GamemodeInitial', () {
      expect(GamemodeCubit().state, GamemodeInitial());
    });

    blocTest<GamemodeCubit,GamemodeState>(
      'initial to 301', 
    build: () => GamemodeCubit(),
    act: (cubit) => cubit.chooseGameMode(3),
    expect: () => [Gamemode301()]
    );

    blocTest<GamemodeCubit,GamemodeState>(
      'initial to 501', 
    build: () => GamemodeCubit(),
    act: (cubit) => cubit.chooseGameMode(4),
    expect: () => [Gamemode501()]
    );

    blocTest<GamemodeCubit,GamemodeState>(
      'initial to 100-170', 
    build: () => GamemodeCubit(),
    act: (cubit) => cubit.chooseGameMode(1),
    expect: () => [Gamemode100to170()]
    );

    blocTest<GamemodeCubit,GamemodeState>(
      'initial to 170-301', 
    build: () => GamemodeCubit(),
    act: (cubit) => cubit.chooseGameMode(2),
    expect: () => [Gamemode170to301()]
    );

    blocTest<GamemodeCubit,GamemodeState>(
      'change Selection', 
    build: () => GamemodeCubit(),
    act: (cubit){cubit.chooseGameMode(2);cubit.chooseGameMode(1);},
    expect: () => [Gamemode170to301(),Gamemode100to170()]
    );

  });
}
