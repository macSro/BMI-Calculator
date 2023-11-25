import 'package:flutter_test/flutter_test.dart';

import 'package:lab1_part1/models/bmi_data.dart';

void main() {
  group('Metric', () {
    final BmiData data = BmiData(weight: 80, height: 180, isMetric: true);
    test('BMI calculation', () {
      expect(data.score.toStringAsFixed(2), equals('24.69'));
    });
    test('BMI categorization', () {
      expect(data.bmiCategory, equals(BmiCategory.normal));
    });
  });

  group('Imperial', () {
    final BmiData data = BmiData(weight: 180, height: 70, isMetric: false);
    test('BMI calculation', () {
      expect(data.score.toStringAsFixed(2), equals('25.82'));
    });
    test('BMI categorization', () {
      expect(data.bmiCategory, equals(BmiCategory.overweight));
    });
  });
}
