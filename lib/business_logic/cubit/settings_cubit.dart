import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsState());

  void changeDarkMode(value) => emit(state.copyWith(darkMode: value));
  void changeIndex(value) => emit(state.copyWith(index: value));
}
