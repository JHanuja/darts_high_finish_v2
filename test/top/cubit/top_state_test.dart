import 'package:darts_high_finish_v2/top/cubit/top_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Top Cubit Test', () {
    test('support value comparison', () {
      expect(const TopState(), const TopState());
    });
  });
}
