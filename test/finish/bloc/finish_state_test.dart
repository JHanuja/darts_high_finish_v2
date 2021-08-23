import 'package:darts_high_finish_v2/finish/bloc/finish_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FinishState', () {
    group('FinishInitial', () {
      test('support value comparison', () {
        expect(const FinishInitial(), const FinishInitial());
      });
    });
    group('Finish Out of Range', () {
      test('support value comparison', () {
        expect(const FinishOutOfRange(score: 100,error:false), const FinishOutOfRange(score:100,error:false));
      });
    });
    group('Finish in range', () {
      test('support value comparison', () {
        expect(
            const FinishInRange(
                error:false,
                d1: 20,
                d2: 18,
                score: 100,
                standartWay: "test",
                waysD1: ['hello'],
                waysD2: ['world']),
            const FinishInRange(
                error:false,
                d1: 20,
                d2: 18,
                score: 100,
                standartWay: "test",
                waysD1: ['hello'],
                waysD2: ['world']));
      });
    });
  });
}
