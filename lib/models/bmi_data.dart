import 'package:lab1_part1/constants.dart';

class BmiData {
  double weight;
  double height;
  bool isMetric;

  BmiData({
    required this.weight,
    required this.height,
    required this.isMetric,
  });

  double get score => (isMetric ? 10000 : 703) * weight / (height * height);

  BmiCategory get bmiCategory {
    if (score < 16.0) {
      return BmiCategory.underweightSevere;
    } else if (score < 17.0) {
      return BmiCategory.underweightModerate;
    } else if (score < 18.5) {
      return BmiCategory.underweightMild;
    } else if (score < 25.0) {
      return BmiCategory.normal;
    } else if (score < 30.0) {
      return BmiCategory.overweight;
    } else if (score < 35.0) {
      return BmiCategory.obeseClass1;
    } else if (score < 40) {
      return BmiCategory.obeseClass2;
    } else {
      return BmiCategory.obeseClass3;
    }
  }

  BmiData.fromJson(Map<String, dynamic> json)
      : weight = json[weightKey],
        height = json[heightKey],
        isMetric = json[unitKey] == unitMetric;

  Map<String, dynamic> toJson() => {
        weightKey: weight,
        heightKey: height,
        unitKey: isMetric ? unitMetric : unitImperial,
      };
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
