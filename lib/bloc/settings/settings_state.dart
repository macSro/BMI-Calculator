part of 'settings_bloc.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class SettingsSet extends SettingsState {
  final bool isMetric;

  SettingsSet({required this.isMetric});
}
