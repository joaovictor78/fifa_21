class HeightVO {
  String? value;
  HeightVO._(this.value);

  static HeightVO create(int heigthCm) {
    final heigthM = HeightVO._(
        '${(heigthCm * 0.01).toDouble().toString().replaceAll('.', ',')} m');
    return heigthM;
  }

  static int convertMettersInCM(double heigthMetters) {
    final int heigthCm = (heigthMetters * 100).toInt();
    return heigthCm;
  }
}
