import 'package:darts_high_finish_v2/doubles/cubit/gamemode_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Game Mode State', () {
    test('Support value comparison', () {
      expect(const GamemodeInitial(), const GamemodeInitial());
      expect(const Gamemode100to170(), const Gamemode100to170());
      expect(const Gamemode170to301(), const Gamemode170to301());
      expect(const Gamemode301(), const Gamemode301());
      expect(const Gamemode501(), const Gamemode501());
    });
  });
}
