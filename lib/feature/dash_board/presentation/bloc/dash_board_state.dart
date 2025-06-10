part of 'dash_board_bloc.dart';

@immutable
sealed class DashBoardState {}

final class DashBoardInitial extends DashBoardState {}

final class DashBoardLoading extends DashBoardState{}

final class DashBoardLoaded extends DashBoardState{
  final bool isGridView;
  final List<DashBoardPersonModel> dashBoardPersonModel;
  DashBoardLoaded(this.dashBoardPersonModel,this.isGridView);
}

class DashboardError extends DashBoardState {
  final String message;

  DashboardError(this.message);
}