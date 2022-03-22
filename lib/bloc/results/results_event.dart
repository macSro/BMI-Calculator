part of 'results_bloc.dart';

@immutable
abstract class ResultsEvent {}

class LoadResults extends ResultsEvent {}

class SaveResults extends ResultsEvent {
  final List<BmiData> results;

  SaveResults({required this.results});
}

class AddResult extends ResultsEvent {
  final List<BmiData> previousResults;
  final BmiData newResult;

  AddResult({required this.previousResults, required this.newResult});
}
