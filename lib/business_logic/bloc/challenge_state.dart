// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'challenge_bloc.dart';

@JsonSerializable(explicitToJson: true)
class ChallengeState {
  final List<ChallengeItem> listOfChallenges;
  final List<PagesRedInDay> listOfRedsPages;

  ChallengeState(
      {this.listOfChallenges = const [], this.listOfRedsPages = const []});

  final challengeOne = ChallengeItem(
      name: 'Przeczytaj 6 książek w tym roku ',
      dateOfStart: DateTime.now(),
      monthsToFinish: 12,
      booksToRead: 6);

  // Methods to conver state class to json and from json

  factory ChallengeState.fromJson(Map<String, dynamic> json) =>
      _$ChallengeStateFromJson(json);

  Map<String, dynamic> toJson() => _$ChallengeStateToJson(this);

  // Copy with method
  ChallengeState copyWith({
    List<ChallengeItem>? listOfChallenges,
  }) {
    return ChallengeState(
      listOfChallenges: listOfChallenges ?? this.listOfChallenges,
    );
  }
}
