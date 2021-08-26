import 'package:darts_high_finish_v2/finish/finish_service/throw.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Throw Test', () {
    test('Throw value', () {
      expect(Throw(100, 3), Throw(100, 3));
    });
  });
}
