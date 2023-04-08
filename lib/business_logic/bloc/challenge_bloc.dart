import 'package:biblioteczka/data/Models/ChallangesModels/challenges_model.dart';
import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:biblioteczka/data/Models/ChallangesModels/challenges_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'challenge_bloc.g.dart';

part 'challenge_event.dart';
part 'challenge_state.dart';

class ChallengeBloc extends HydratedBloc<ChallengeEvent, ChallengeState> {
  ChallengeBloc() : super(ChallengeState()) {
    on<AddChallenge>(addChallenge);
    on<RemoveChallenge>(removeChallenge);
    on<AddReadPages>(addReadPages);
  }

  void addChallenge(AddChallenge event, Emitter<ChallengeState> emit) {
    emit(state.copyWith(
        listOfChallenges: List.of(state.listOfChallenges)..add(event.item)));
  }

  void removeChallenge(RemoveChallenge event, Emitter<ChallengeState> emit) {
    emit(state.copyWith(
        listOfChallenges: List.of(state.listOfChallenges)
          ..removeAt(event.indexOfRemoved)));
  }

  void addReadPages(AddReadPages event, Emitter<ChallengeState> emit) {
    emit(state.copyWith(
        listOfRedsPages: List.of(state.listOfRedsPages)
          ..add(PagesReadInDay(
              dateTime: DateTime.now(), pages: event.readPages))));
  }

  @override
  ChallengeState? fromJson(Map<String, dynamic> json) {
    return ChallengeState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(ChallengeState state) {
    return state.toJson();
  }
}
