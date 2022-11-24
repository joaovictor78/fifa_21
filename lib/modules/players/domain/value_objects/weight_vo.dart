class WeightVO {
  String? value;
  WeightVO._(this.value);

  static WeightVO create(int weightKg) {
    final WeightVO weight = WeightVO._('$weightKg kg');
    return weight;
  }
}
