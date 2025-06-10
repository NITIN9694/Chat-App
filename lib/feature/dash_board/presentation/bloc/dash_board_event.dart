part of 'dash_board_bloc.dart';

@immutable
sealed class DashBoardEvent {}

class LoadDashBoardData extends DashBoardEvent{}

class ToggleViewType extends DashBoardEvent {
  final bool isGridView;
  ToggleViewType({required this.isGridView});
}