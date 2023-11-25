import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:lab1_part1/config.dart';
import 'package:lab1_part1/constants.dart';

import '../../models/bmi_data.dart';

class ResultsScreen extends StatelessWidget {
  final List<BmiData> results;

  const ResultsScreen({Key? key, required this.results}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(previousResultsTitleAndValue),
      ),
      body: ListView(
        children: results
            .map(
              (BmiData result) => Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.equalizer_rounded,
                    size: 40,
                  ),
                  title: Text(
                    'BMI: ' + result.score.toStringAsFixed(2),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    EnumToString.convertToString(
                      result.bmiCategory,
                      camelCase: true,
                    ),
                    style: TextStyle(
                      color: bmiCategoryColors[result.bmiCategory],
                    ),
                  ),
                ),
              ),
            )
            .toList()
            .reversed
            .toList(),
      ),
    );
  }
}
