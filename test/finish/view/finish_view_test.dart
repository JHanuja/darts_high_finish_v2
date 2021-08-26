

import 'package:darts_high_finish_v2/doubles/cubit/gamemode_cubit.dart';
import 'package:darts_high_finish_v2/finish/view/finish_view.dart';
import 'package:darts_high_finish_v2/finish/view/score_view.dart';
import 'package:darts_high_finish_v2/finish/view/ways_wait_keyboard_view.dart';
import 'package:darts_high_finish_v2/main.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test Finish View', () {
    testWidgets('Finish View rendered', (tester) async {
      await tester
          .pumpWidget(MyApp(child:FinishView(d1: 18, d2: 20, gameMode: Gamemode100to170())));
      expect(find.byType(Score), findsOneWidget);
      expect(find.byType(WaysWaitKeyboard), findsOneWidget);
    });
  });
}
