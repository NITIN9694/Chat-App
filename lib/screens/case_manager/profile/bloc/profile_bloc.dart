import 'package:bloc/bloc.dart';
import 'package:endeavors/screens/case_manager/profile/data/model/profile_employment_goals_model.dart';
import 'package:endeavors/screens/case_manager/profile/data/repo/profile_employement_conditions_repo.dart';
import 'package:meta/meta.dart';

import '../data/model/profile_employment_conditions_model.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileEmploymentConditionRepo repository;
  bool isEmploymentConditionsExpanded = true;
  List<ProfileEmploymentConditionsModel> _list = [];
  List<ProfileEmploymentGoalsModel> _profileEmploymentGoalList = [];
  bool isEmploymentGoalExpanded = true;

  ProfileBloc(this.repository) : super(ProfileInitial()) {
    on<LoadedEmploymentConditionsData>((event, emit) async {
      emit(EmploymentConditionsLoading());
      try {
        _list = await repository.fetchData();
        _profileEmploymentGoalList = await repository.fetchEmploymentGoalData();

        emit(EmploymentConditionsLoaded(
            profileEmploymentConditionsModel: _list,
            profileEmploymentGoalModel: _profileEmploymentGoalList));
      } catch (e) {
        print("error $e");
      }
    });

    on<ToggleEmploymentConditionsExpansion>((event, emit) {
      if (state is EmploymentConditionsLoaded) {
        final currentState = state as EmploymentConditionsLoaded;
        emit(
          currentState.copyWith(
            isEmploymentConditionsExpanded:
                !currentState.isEmploymentConditionsExpanded,
          ),
        );
      }
    });

    on<ToggleEmploymentGoals>((event, emit) {
      if (state is EmploymentConditionsLoaded) {
        final currentState = state as EmploymentConditionsLoaded;
        emit(currentState.copyWith(
          isEmploymentGoalsExpanded: !currentState.isEmploymentGoalsExpanded,
        ));
      }
    });

    //onTap Toggle Goal
    on<ToggleEmploymentGoalsExpand>((event, emit) {
      final currentState = state;
      if (currentState is EmploymentConditionsLoaded) {
        final updatedList = currentState.profileEmploymentGoalModel
            .asMap()
            .map((i, goal) => MapEntry(
            i,
            i == event.index
                ? goal.copyWith(isExpand: !goal.isExpand)
                : goal))
            .values
            .toList();

        emit(currentState.copyWith(profileEmploymentGoalModel: updatedList));
      }
    });

    on<ProfileEvent>((event, emit) {});
  }
}
