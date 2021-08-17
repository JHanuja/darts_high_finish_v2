import 'package:darts_high_finish_v2/ways.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Way Classes', () {
    test('Just Double', () {
      expect(JustDouble(finish: 20).convertToString(), 'D20');
    });
    test('Double Double', () {
      expect(
          DoubleDouble(finish: 20, prepare: 10).convertToString(), 'D10  D20');
    });
    test('Single Double', () {
      expect(
          SingleDouble(finish: 20, prepare: 10).convertToString(), '10  D20');
    });
    test('Single Double Double', () {
      expect(
          SingleDoubleDouble(finish: 20, prepare1: 10, prepare2: 18)
              .convertToString(),
          'D18  10  D20');
    });
    test('Single Triple Double', () {
      expect(
          SingleTripleDouble(finish: 20, prepare1: 10, prepare2: 18)
              .convertToString(),
          'T18  10  D20');
    });
    test('Triple Double', () {
      expect(
          TripleDouble(finish: 20, prepare: 18).convertToString(), 'T18  D20');
    });
    test('Triple Double Double', () {
      expect(
          TripleDoubleDouble(finish: 20, prepare1: 18, prepare2: 19)
              .convertToString(),
          'T18  D19  D20');
    });
    test('Triple Triple Double', () {
      expect(
          TripleTripleDouble(finish: 20, prepare1: 18, prepare2: 19)
              .convertToString(),
          'T18  T19  D20');
    });
    test('Triple Triple Bull', () {
      expect(TripleTripleBull(prepare1: 18, prepare2: 19).convertToString(),
          'T18  T19  Bull');
    });
    test('Bogey', () {
      expect(Bogey().convertToString(), 'Bogey');
    });
  });
}
