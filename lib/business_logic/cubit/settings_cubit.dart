import 'package:biblioteczka/data/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'dart:convert';
import '../../data/Models/book_model.dart';
import '../../router.dart';

part 'settings_state.dart';

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit() : super(const SettingsState()) {
    if (state.index > 0) {
      changeIndex(0);
    }
  }

  void changeDarkMode(value) => emit(state.copyWith(darkMode: value));
  void changeIndex(value) => emit(state.copyWith(index: value));
  void choosenBook(Book book) => emit(state.copyWith(chosenBook: book));

  // Methods to write and read state from json
  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    return SettingsState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    return state.toMap();
  }
}
