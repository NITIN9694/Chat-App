part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class EmploymentConditionsLoading extends ProfileInitial {}

class EmploymentConditionsLoaded extends ProfileState {
  final List<ProfileEmploymentConditionsModel> profileEmploymentConditionsModel;
  final bool isEmploymentConditionsExpanded;
  final List<ProfileEmploymentGoalsModel> profileEmploymentGoalModel;
  final bool isEmploymentGoalsExpanded;

  EmploymentConditionsLoaded({
    required this.profileEmploymentConditionsModel,
    this.isEmploymentConditionsExpanded = true,
    required this.profileEmploymentGoalModel,
    this.isEmploymentGoalsExpanded = true,
  });

  EmploymentConditionsLoaded copyWith({
    List<ProfileEmploymentConditionsModel>? profileEmploymentConditionsModel,
    bool? isEmploymentConditionsExpanded,
    List<ProfileEmploymentGoalsModel>? profileEmploymentGoalModel,
    bool? isEmploymentGoalsExpanded,

  }) {
    return EmploymentConditionsLoaded(
      profileEmploymentConditionsModel: profileEmploymentConditionsModel ??
          this.profileEmploymentConditionsModel,
      isEmploymentConditionsExpanded:
          isEmploymentConditionsExpanded ?? this.isEmploymentConditionsExpanded,
      profileEmploymentGoalModel: profileEmploymentGoalModel??this.profileEmploymentGoalModel,
        isEmploymentGoalsExpanded: isEmploymentGoalsExpanded??this.isEmploymentGoalsExpanded
    );
  }
}

