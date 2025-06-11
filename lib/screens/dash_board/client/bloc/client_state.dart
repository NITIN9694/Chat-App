part of 'client_bloc.dart';

@immutable
sealed class ClientState {}

final class ClientInitial extends ClientState {}
final class ClientLoading extends ClientInitial{}

final class ClientLoaded extends ClientInitial{
  late final bool isGridView;
  final List<ClientPersonModel> dashBoardPersonModel;
  ClientLoaded(this.dashBoardPersonModel,this.isGridView);
}


