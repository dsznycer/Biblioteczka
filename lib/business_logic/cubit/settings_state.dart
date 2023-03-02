// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'settings_cubit.dart';

@JsonSerializable()
class SettingsState {
  final int index;
  final bool darkMode;

  const SettingsState({
    this.index = 0,
    this.darkMode = false,
  });

  // Methods to convert state to json and from json
  factory SettingsState.fromJson(Map<String, dynamic> json) =>
      _$SettingsStateFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsStateToJson(this);

  // Method to copy class with new values
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
