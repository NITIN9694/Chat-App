part of 'client_support_bloc.dart';

@immutable
sealed class ClientSupportState {}

final class ClientSupportInitial extends ClientSupportState {}

class FaqState extends ClientSupportState{
  final int? expandedGroupIndex;
  final int? expandedQuestionIndex;
  FaqState({this.expandedGroupIndex, this.expandedQuestionIndex});
}

