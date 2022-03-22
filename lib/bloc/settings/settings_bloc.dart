import 'package:bloc/bloc.dart';
import 'package:lab1_part1/services/shared_preferences_service.dart';
import 'package:meta/meta.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SharedPreferencesService _sharedService;
  SettingsBloc(this._sharedService) : super(SettingsInitial()) {
    on<LoadSettings>(((event, emit) async {
      final isMetric = await _sharedService.loadUnit();
      emit(SettingsSet(isMetric: isMetric));
    }));
    on<SetSettings>((event, emit) {
      emit(SettingsSet(isMetric: event.isMetric));
    });
  }
}
