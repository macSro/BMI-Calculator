import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab1_part1/bloc/calculate/calculate_bloc.dart';
import 'package:lab1_part1/bloc/results/results_bloc.dart';
import 'package:lab1_part1/bloc/settings/settings_bloc.dart';
import 'package:lab1_part1/services/shared_preferences_service.dart';

class BlocWrapper extends StatelessWidget {
  final Widget child;

  const BlocWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => SharedPreferencesService(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SettingsBloc(
              RepositoryProvider.of<SharedPreferencesService>(context),
            )..add(LoadSettings()),
          ),
          BlocProvider(
            create: (context) => ResultsBloc(
              RepositoryProvider.of<SharedPreferencesService>(context),
            )..add(LoadResults()),
          ),
          BlocProvider(
            create: (context) => CalculateBloc(),
          ),
        ],
        child: child,
      ),
    );
  }
}
