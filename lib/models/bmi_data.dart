import 'package:lab1_part1/constants.dart';

class BmiData {
  double weight;
  double height;
  bool isMetric;
  BmiCategory? bmiCategory;
  double? score;

  BmiData({
    required this.weight,
    required this.height,
    required this.isMetric,
  });

  BmiData.fromJson(Map<String, dynamic> json)
      : weight = json[weightKey],
        height = json[heightKey],
        isMetric = json[unitKey] == unitMetric;

  Map<String, dynamic> toJson() => {
        weightKey: weight,
        heightKey: height,
        unitKey: isMetric ? unitMetric : unitImperial,
      };

  void calculate() {
    score = (isMetric ? 10000 : 703) * weight / (height * height);
  }

  void categorize() {
    final score = this.score!;
    if (score < 16.0) {
      bmiCategory = BmiCategory.underweightSevere;
    } else if (score < 17.0) {
      bmiCategory = BmiCategory.underweightModerate;
    } else if (score < 18.5) {
      bmiCategory = BmiCategory.underweightMild;
    } else if (score < 25.0) {
      bmiCategory = BmiCategory.normal;
    } else if (score < 30.0) {
      bmiCategory = BmiCategory.overweight;
    } else if (score < 35.0) {
      bmiCategory = BmiCategory.obeseClass1;
    } else if (score < 40) {
      bmiCategory = BmiCategory.obeseClass2;
    } else {
      bmiCategory = BmiCategory.obeseClass3;
    }
  }
}

enum BmiCategory {
  underweightSevere,
  underweightModerate,
  underweightMild,
  normal,
  overweight,
  obeseClass1,
  obeseClass2,
  obeseClass3
}
