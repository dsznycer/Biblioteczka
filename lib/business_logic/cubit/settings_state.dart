// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'settings_cubit.dart';

class SettingsState {
  final int index;
  final bool darkMode;
  final Book chosenBook;

  const SettingsState({
    this.index = 0,
    this.darkMode = false,
    this.chosenBook = const Book(title: 'This is test book'),
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
}
