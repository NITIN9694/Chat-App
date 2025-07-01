part of 'client_profile_bloc.dart';

@immutable
sealed class ClientProfileEvent {}

class LoadedClientConditionsData extends ClientProfileEvent{}


class ToggleClientConditionsExpansion extends ClientProfileEvent {}

class ToggleClientGoals extends ClientProfileEvent {}

class ToggleClientGoalsExpand extends ClientProfileEvent {
  final int index;
  ToggleClientGoalsExpand(this.index);
}
