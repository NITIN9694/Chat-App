part of 'case_manager_bloc.dart';

@immutable
sealed class CaseManagerEvent {}
class LoadCaseManagerData extends CaseManagerEvent{}

class ToggleViewType extends CaseManagerEvent {
  final bool isGridView;
  ToggleViewType({required this.isGridView});
}