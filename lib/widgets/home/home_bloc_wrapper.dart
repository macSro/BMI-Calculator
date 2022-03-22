import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab1_part1/bloc/results/results_bloc.dart';
import 'package:lab1_part1/widgets/home/home_screen.dart';

import '../../bloc/calculate/calculate_bloc.dart';
import '../../bloc/settings/settings_bloc.dart';

class HomeBlocWrapper extends StatelessWidget {
  const HomeBlocWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResultsBloc, ResultsState>(
      builder: (context, resultsState) {
        if (resultsState is ResultsLoaded) {
          return BlocListener<CalculateBloc, CalculateState>(
            listener: (context, calculateStateListen) {
              if (calculateStateListen is BmiCalculated) {
                BlocProvider.of<ResultsBloc>(context).add(
                  AddResult(
                    newResult: calculateStateListen.bmiData,
                    previousResults: resultsState.results,
                  ),
                );
              }
            },
            child: BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, settingsState) {
                if (settingsState is SettingsSet) {
                  return HomeScreen(
                    results: resultsState.results,
                    isMetric: settingsState.isMetric,
                  );
                }
                return Container();
              },
            ),
          );
        }
        return Container();
      },
    );
  }
}
