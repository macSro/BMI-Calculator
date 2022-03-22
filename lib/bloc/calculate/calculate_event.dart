part of 'calculate_bloc.dart';

@immutable
abstract class CalculateEvent {}

class CalculateBmi extends CalculateEvent {
  final double weight;
  final double height;
  final bool isMetric;

  CalculateBmi({
    required this.weight,
    required this.height,
    required this.isMetric,
  });
}
