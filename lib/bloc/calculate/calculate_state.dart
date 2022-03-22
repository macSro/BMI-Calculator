part of 'calculate_bloc.dart';

@immutable
abstract class CalculateState {}

class BmiInitial extends CalculateState {}

class BmiCalculated extends CalculateState {
  final BmiData bmiData;

  BmiCalculated({required this.bmiData});
}
