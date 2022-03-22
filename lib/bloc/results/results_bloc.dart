import 'package:bloc/bloc.dart';
import 'package:lab1_part1/models/bmi_data.dart';
import 'package:lab1_part1/services/shared_preferences_service.dart';
import 'package:meta/meta.dart';

import '../../config.dart';

part 'results_event.dart';
part 'results_state.dart';

class ResultsBloc extends Bloc<ResultsEvent, ResultsState> {
  final SharedPreferencesService _sharedService;
  ResultsBloc(this._sharedService) : super(ResultsInitial()) {
    on<LoadResults>(
      (event, emit) async {
        emit(ResultsInitial());
        final results = await _sharedService.loadResults();
        for (BmiData bmiData in results) {
          bmiData.calculate();
          bmiData.categorize();
        }
        emit(ResultsLoaded(results));
      },
    );

    on<SaveResults>(
      (event, emit) async {
        await _sharedService.saveResults(event.results);
        emit(ResultsLoaded(event.results));
      },
    );

    on<AddResult>(
      (event, emit) {
        if (event.previousResults.length + 1 > savedResultsCount) {
          event.previousResults.removeAt(0);
        }
        event.previousResults.add(event.newResult);
        emit(ResultsLoaded(event.previousResults));
        add(SaveResults(results: event.previousResults));
      },
    );
  }
}
