import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsState());

  void changeDarkMode(value) => emit(SettingsState().copyWith(darkMode: value));
  void changeIndex(value) => emit(SettingsState().copyWith(index: value));
}
