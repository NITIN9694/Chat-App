part of 'client_support_bloc.dart';

@immutable
sealed class ClientSupportEvent {}





class ToggleGroup extends ClientSupportEvent {
  final int groupIndex;
  ToggleGroup(this.groupIndex);
}

class ToggleQuestion extends ClientSupportEvent {
  final int questionIndex;
  ToggleQuestion(this.questionIndex);
}
