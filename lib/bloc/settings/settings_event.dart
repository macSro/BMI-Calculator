part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent {}

class LoadSettings extends SettingsEvent {}

class SetSettings extends SettingsEvent {
  final bool isMetric;

  SetSettings({required this.isMetric});
}
