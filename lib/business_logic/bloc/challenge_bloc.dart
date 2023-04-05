import 'package:biblioteczka/data/Models/ChallangesModels/challenges_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:biblioteczka/data/Models/ChallangesModels/challenges_model.dart';

part 'challenge_event.dart';
part 'challenge_state.dart';

class ChallengeBloc extends Bloc<ChallengeEvent, ChallengeState> {
  ChallengeBloc() : super(ChallengeState()) {
    on<AddChallenge>(addChallenge);
  }

  void addChallenge(AddChallenge eventi, Emitter<ChallengeState> emit) {
    emit(state.copyWith(
        listOfChallenges: List.of(state.listOfChallenges)..add(eventi.item)));
  }
}
