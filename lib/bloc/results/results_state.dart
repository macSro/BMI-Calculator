part of 'results_bloc.dart';

@immutable
abstract class ResultsState {}

class ResultsInitial extends ResultsState {}

class ResultsLoaded extends ResultsState {
  final List<BmiData> results;

  ResultsLoaded(this.results);
}
