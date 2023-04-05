// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'challenge_bloc.dart';

class ChallengeState {
  final List<ChallengeItem> listOfChallenges;

  ChallengeState({this.listOfChallenges = const []});

  final challengeOne = ChallengeItem(
      name: 'Przeczytaj 6 książek ',
      dateOfStart: DateTime.now(),
      monthsToFinish: 6,
      bookToRead: 12);

  // Copy with method
  ChallengeState copyWith({
    List<ChallengeItem>? listOfChallenges,
  }) {
    return ChallengeState(
      listOfChallenges: listOfChallenges ?? this.listOfChallenges,
    );
  }
}
