// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'settings_cubit.dart';

class SettingsState {
  final int index;
  final bool darkMode;

  SettingsState({this.index = 0, this.darkMode = false});

  SettingsState copyWith({
    int? index,
    bool? darkMode,
  }) {
    return SettingsState(
      index: index ?? this.index,
      darkMode: darkMode ?? this.darkMode,
    );
  }
}
