// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'settings_cubit.dart';

@JsonSerializable()
class SettingsState {
  final int index;
  final bool darkMode;
  final Book chosenBook;
  final String heroTag;

  const SettingsState({
    this.index = 0,
    this.darkMode = false,
    this.chosenBook = const Book(
        title: 'This is test book',
        author: 'test',
        yearOfEnd: '2023',
        pages: '23',
        notes: ['notes'],
        bookProgress: BookProgress.inProgress,
        score: 2),
    this.heroTag = 'test123',
  });

  // Methods to convert state to json and from json
  factory SettingsState.fromJson(Map<String, dynamic> json) =>
      _$SettingsStateFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsStateToJson(this);

  SettingsState copyWith({
    int? index,
    bool? darkMode,
    Book? chosenBook,
    String? heroTag,
  }) {
    return SettingsState(
      index: index ?? this.index,
      darkMode: darkMode ?? this.darkMode,
      chosenBook: chosenBook ?? this.chosenBook,
      heroTag: heroTag ?? this.heroTag,
    );
  }
}
