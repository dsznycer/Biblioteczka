import 'package:biblioteczka/data/models/book_model.dart';
import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

part 'settings_state.dart';

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit() : super(SettingsState());

  void changeDarkMode(value) => emit(state.copyWith(darkMode: value));
  void changeIndex(value) => emit(state.copyWith(index: value));
  void choosenBook(Book book) => emit(state.copyWith(chosenBook: book));

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    return SettingsState.fromMap(json);
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    return state.toMap();
    throw UnimplementedError();
  }
}
