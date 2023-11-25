import 'package:flutter/material.dart';
import 'package:lab1_part1/models/bmi_data.dart';

import 'constants.dart';

const String unitDefault = unitMetric;

const double paddingDefault = 32.0;
const double fontSizeBig = 24.0;

const int savedResultsCount = 10;

const Map<BmiCategory, Color> bmiCategoryColors = {
  BmiCategory.underweightSevere: Colors.blue,
  BmiCategory.underweightModerate: Colors.blue,
  BmiCategory.underweightMild: Colors.blue,
  BmiCategory.normal: Colors.green,
  BmiCategory.overweight: Colors.red,
  BmiCategory.obeseClass1: Colors.red,
  BmiCategory.obeseClass2: Colors.red,
  BmiCategory.obeseClass3: Colors.red,
};
