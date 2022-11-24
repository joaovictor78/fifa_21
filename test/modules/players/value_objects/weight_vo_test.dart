import 'package:fifa21/modules/players/domain/value_objects/weight_vo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Weight VO', () {
    test('should return the weight in kg', () {
      final weight = WeightVO.create(67);
      expect(weight, '67 kg');
    });
  });
}
