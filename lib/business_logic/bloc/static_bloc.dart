import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'static_event.dart';
part 'static_state.dart';

class StaticBloc extends Bloc<StaticEvent, StaticState> {
  StaticBloc() : super(StaticState()) {
    Future<void> valueP(ChangeValueP event, emit) async {
      await Future.delayed(Duration(seconds: 1));
      emit(StaticState(i: state.i + 1));
    }

    on<ChangeValueP>(valueP);

    on<ChangeValueM>((event, emit) {
      emit(StaticState(i: state.i - 1));
    });
  }
}
