part of 'client_profile_bloc.dart';

@immutable
sealed class ClientProfileState {}

final class ClientProfileInitial extends ClientProfileState {}

final class ClientConditionsLoading extends ClientProfileInitial {}

class ClientConditionsLoaded extends ClientProfileState {
  final List<ProfileEmploymentConditionsModel> profileEmploymentConditionsModel;
  final bool isEmploymentConditionsExpanded;
  final List<ProfileEmploymentGoalsModel> profileEmploymentGoalModel;
  final bool isEmploymentGoalsExpanded;

  ClientConditionsLoaded({
    required this.profileEmploymentConditionsModel,
    this.isEmploymentConditionsExpanded = true,
    required this.profileEmploymentGoalModel,
    this.isEmploymentGoalsExpanded = true,
  });

  ClientConditionsLoaded copyWith({
    List<ProfileEmploymentConditionsModel>? profileEmploymentConditionsModel,
    bool? isEmploymentConditionsExpanded,
    List<ProfileEmploymentGoalsModel>? profileEmploymentGoalModel,
    bool? isEmploymentGoalsExpanded,

  }) {
    return ClientConditionsLoaded(
        profileEmploymentConditionsModel: profileEmploymentConditionsModel ??
            this.profileEmploymentConditionsModel,
        isEmploymentConditionsExpanded:
        isEmploymentConditionsExpanded ?? this.isEmploymentConditionsExpanded,
        profileEmploymentGoalModel: profileEmploymentGoalModel??this.profileEmploymentGoalModel,
        isEmploymentGoalsExpanded: isEmploymentGoalsExpanded??this.isEmploymentGoalsExpanded
    );
  }
}

