import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab1_part1/bloc/settings/settings_bloc.dart';
import 'package:lab1_part1/constants.dart';
import 'package:lab1_part1/models/bmi_data.dart';
import 'package:lab1_part1/widgets/home/bmi_form.dart';

import '../../bloc/calculate/calculate_bloc.dart';
import '../../config.dart';
import '../author/author_screen.dart';
import '../result_info/result_info_screen.dart';
import '../results/results_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<BmiData> results;
  final bool isMetric;

  const HomeScreen({Key? key, required this.results, required this.isMetric})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
          actions: [
            PopupMenuButton(
              itemBuilder: ((context) => [
                    const PopupMenuItem(
                      child: Text(unitChangeTitleAndValue),
                      value: unitChangeTitleAndValue,
                    ),
                    const PopupMenuItem(
                      child: Text(previousResultsTitleAndValue),
                      value: previousResultsTitleAndValue,
                    ),
                    const PopupMenuItem(
                      child: Text(authorInfoTitleAndValue),
                      value: authorInfoTitleAndValue,
                    ),
                  ]),
              onSelected: (String choice) => _onActionSelected(context, choice),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: paddingDefault),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BmiForm(isMetric: isMetric),
              Expanded(
                child: Center(
                  child: BlocBuilder<CalculateBloc, CalculateState>(
                    builder: (context, state) {
                      if (state is BmiCalculated) {
                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ResultInfoScreen(),
                              settings: RouteSettings(
                                name: 'bmi',
                                arguments: state.bmiData,
                              ),
                            ),
                          ),
                          child: Text(
                            'BMI: ${state.bmiData.score!.toStringAsFixed(2)}',
                            key: const Key(resultKey),
                            style: TextStyle(
                              fontSize: fontSizeBig,
                              fontWeight: FontWeight.bold,
                              color: _mapBmiCategoryColor(
                                  state.bmiData.bmiCategory!),
                            ),
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onActionSelected(BuildContext context, String choice) {
    switch (choice) {
      case unitChangeTitleAndValue:
        BlocProvider.of<SettingsBloc>(context).add(
          SetSettings(isMetric: !isMetric),
        );
        break;
      case previousResultsTitleAndValue:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultsScreen(results: results),
          ),
        );
        break;
      case authorInfoTitleAndValue:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AuthorScreen(),
          ),
        );
        break;
    }
  }

  Color _mapBmiCategoryColor(BmiCategory category) {
    if (category == BmiCategory.underweightSevere ||
        category == BmiCategory.underweightModerate ||
        category == BmiCategory.underweightMild) {
      return Colors.blue;
    } else if (category == BmiCategory.overweight ||
        category == BmiCategory.obeseClass1 ||
        category == BmiCategory.obeseClass2 ||
        category == BmiCategory.obeseClass3) {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }
}
