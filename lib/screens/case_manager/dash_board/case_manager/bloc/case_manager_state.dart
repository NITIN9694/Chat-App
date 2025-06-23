part of 'case_manager_bloc.dart';

@immutable
sealed class CaseManagerState {}

final class CaseManagerInitial extends CaseManagerState {}


final class CaseManagerLoading extends CaseManagerInitial{}

final class CaseManagerLoaded extends CaseManagerInitial{
  late final bool isGridView;
  final List<CaseManagerPersonModel> dashBoardPersonModel;
  CaseManagerLoaded(this.dashBoardPersonModel,this.isGridView);
}