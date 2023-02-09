// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'settings_cubit.dart';

@JsonSerializable()
class SettingsState {
  final int index;
  final bool darkMode;
  final Book chosenBook;

  const SettingsState({
    this.index = 0,
    this.darkMode = false,
    this.chosenBook = const Book(
        title: 'This is test book',
        author: 'test',
        yearOfEnd: '2023',
        pages: '23',
        notes: ['notes'],
        score: 2),
  });

  SettingsState copyWith({
    int? index,
    bool? darkMode,
    Book? chosenBook,
  }) {
    return SettingsState(
      index: index ?? this.index,
      darkMode: darkMode ?? this.darkMode,
      chosenBook: chosenBook ?? this.chosenBook,
    );
  }

  factory SettingsState.fromJson(Map<String, dynamic> json) =>
      _$SettingsStateFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsStateToJson(this);
}
