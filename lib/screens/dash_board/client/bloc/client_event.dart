part of 'client_bloc.dart';

@immutable
sealed class ClientEvent {}
class LoadClientData extends ClientEvent{}

class ToggleViewType extends ClientEvent {
  final bool isGridView;
  ToggleViewType({required this.isGridView});
}