part of 'challenge_bloc.dart';

abstract class ChallengeEvent {
  const ChallengeEvent();
}

class AddChallenge extends ChallengeEvent {
  const AddChallenge({required this.item});
  final ChallengeItem item;
}

class RemoveChallenge extends ChallengeEvent {
  const RemoveChallenge({required this.indexOfRemoved});
  final int indexOfRemoved;
}

class AddReadPages extends ChallengeEvent {
  const AddReadPages({required this.readPages});
  final int readPages;
}
