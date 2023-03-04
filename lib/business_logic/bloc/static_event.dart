part of 'static_bloc.dart';

@immutable
abstract class StaticEvent {
  const StaticEvent();
}

class ChangeValueP extends StaticEvent {
  const ChangeValueP();
}

class ChangeValueM extends StaticEvent {
  const ChangeValueM();
}
