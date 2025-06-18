part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}
class LoadedEmploymentConditionsData extends ProfileEvent{}


class ToggleEmploymentConditionsExpansion extends ProfileEvent {}

class ToggleEmploymentGoals extends ProfileEvent {}

class ToggleEmploymentGoalsExpand extends ProfileEvent {
  final int index;
  ToggleEmploymentGoalsExpand(this.index);
}
