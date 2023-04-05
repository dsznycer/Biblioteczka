part of 'challenge_bloc.dart';

abstract class ChallengeEvent {
  const ChallengeEvent();
}

class AddChallenge extends ChallengeEvent {
  const AddChallenge({required this.item});
  final ChallengeItem item;
}

class RemoveChallenge extends ChallengeEvent {
  const RemoveChallenge({required int index});
}
