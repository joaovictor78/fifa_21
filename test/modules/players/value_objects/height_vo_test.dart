import 'package:fifa21/modules/players/domain/value_objects/height_vo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Height VO |', () {
    test('should return the height in meters', () {
      final heightVO = HeightVO.create(167);
      expect(heightVO, '1,67 m');
    });

    test('should return the height in cm', () {
      final heightVO = HeightVO.convertMettersInCM(1.66);
      expect(heightVO, 166);
    });
  });
}
