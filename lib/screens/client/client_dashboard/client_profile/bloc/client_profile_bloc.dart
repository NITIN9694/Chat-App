import 'package:bloc/bloc.dart';
import 'package:endeavors/screens/case_manager/profile/data/model/profile_employment_conditions_model.dart';
import 'package:endeavors/screens/case_manager/profile/data/model/profile_employment_goals_model.dart';
import 'package:endeavors/screens/client/client_dashboard/client_profile/data/repo/client_repo_profile.dart';
import 'package:meta/meta.dart';

part 'client_profile_event.dart';
part 'client_profile_state.dart';

class ClientProfileBloc extends Bloc<ClientProfileEvent, ClientProfileState> {
  final ClientProfileRepo repository;
  bool isEmploymentConditionsExpanded = true;
  List<ProfileEmploymentConditionsModel> _list = [];
  List<ProfileEmploymentGoalsModel> _profileEmploymentGoalList = [];
  bool isEmploymentGoalExpanded = true;

  ClientProfileBloc(this.repository) : super(ClientProfileInitial()) {
    on<LoadedClientConditionsData>((event, emit) async {
      emit(ClientConditionsLoading());
      try {
        _list = await repository.fetchData();
        _profileEmploymentGoalList = await repository.fetchEmploymentGoalData();

        emit(ClientConditionsLoaded(
            profileEmploymentConditionsModel: _list,
            profileEmploymentGoalModel: _profileEmploymentGoalList));
      } catch (e) {
        print("error $e");
      }
    });

    on<ToggleClientConditionsExpansion>((event, emit) {
      if (state is ClientConditionsLoaded) {
        final currentState = state as ClientConditionsLoaded;
        emit(
          currentState.copyWith(
            isEmploymentConditionsExpanded:
            !currentState.isEmploymentConditionsExpanded,
          ),
        );
      }
    });

    on<ToggleClientGoals>((event, emit) {
      if (state is ClientConditionsLoaded) {
        final currentState = state as ClientConditionsLoaded;
        emit(currentState.copyWith(
          isEmploymentGoalsExpanded: !currentState.isEmploymentGoalsExpanded,
        ));
      }
    });

    //onTap Toggle Goal
    on<ToggleClientGoalsExpand>((event, emit) {
      final currentState = state;
      if (currentState is ClientConditionsLoaded) {
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

    on<ClientProfileEvent>((event, emit) {

    });
  }
}
