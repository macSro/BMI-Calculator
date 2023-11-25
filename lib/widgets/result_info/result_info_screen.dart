import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:lab1_part1/config.dart';
import 'package:lab1_part1/constants.dart';
import 'package:lab1_part1/models/bmi_data.dart';

class ResultInfoScreen extends StatelessWidget {
  const ResultInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bmiData = ModalRoute.of(context)!.settings.arguments as BmiData;
    return Scaffold(
      appBar: AppBar(title: const Text(resultInfoTitle)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'BMI: ${bmiData.score.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: fontSizeBig,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: paddingDefault / 2),
            Text(
              'Category: ${EnumToString.convertToString(
                bmiData.bmiCategory,
                camelCase: true,
              )}',
              style: TextStyle(color: bmiCategoryColors[bmiData.bmiCategory]),
            ),
          ],
        ),
      ),
    );
  }
}
