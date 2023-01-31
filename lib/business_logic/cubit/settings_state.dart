// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'settings_cubit.dart';

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'index': index,
      'darkMode': darkMode,
      'chosenBook': chosenBook.toJson(),
    };
  }

  factory SettingsState.fromMap(Map<String, dynamic> map) {
    return SettingsState(
      index: map['index'] as int,
      darkMode: map['darkMode'] as bool,
      chosenBook: Book.fromJson(map['chosenBook'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory SettingsState.fromJson(String source) =>
      SettingsState.fromMap(json.decode(source) as Map<String, dynamic>);
}
