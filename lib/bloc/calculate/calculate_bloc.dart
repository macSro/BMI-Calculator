import 'package:bloc/bloc.dart';
import 'package:lab1_part1/models/bmi_data.dart';
import 'package:meta/meta.dart';

part 'calculate_event.dart';
part 'calculate_state.dart';

class CalculateBloc extends Bloc<CalculateEvent, CalculateState> {
  CalculateBloc() : super(BmiInitial()) {
    on<CalculateBmi>(
      (event, emit) => emit(
        BmiCalculated(
          bmiData: BmiData(
            weight: event.weight,
            height: event.height,
            isMetric: event.isMetric,
          ),
        ),
      ),
    );
  }
}
