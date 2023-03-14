import 'package:biblioteczka/data/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import '../../data/Models/book_model.dart';
import '../../router.dart';
import 'package:json_annotation/json_annotation.dart';

part 'settings_state.dart';
part 'settings_cubit.g.dart';

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit() : super(const SettingsState(index: 0)) {
    if (state.index > 0) {
      changeIndex(0);
    }
  }

  void changeDarkMode(value) => emit(state.copyWith(darkMode: value));
  void changeIndex(value) => emit(state.copyWith(index: value));

  // Methods to write and read state from json
  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    return SettingsState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    return state.toJson();
  }
}
