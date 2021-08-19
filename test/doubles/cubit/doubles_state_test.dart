import 'package:darts_high_finish_v2/doubles/cubit/doubles_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DoublesState Test', () {
    test('support value comparison', () {
      expect(const DoublesState(d1:0,d2:0), const DoublesState(d1:0,d2:0));
    });
  });
}
