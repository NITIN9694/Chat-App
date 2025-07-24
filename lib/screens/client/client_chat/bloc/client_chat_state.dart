part of 'client_chat_bloc.dart';

@immutable
sealed class ClientChatState {}

final class ClientChatInitial extends ClientChatState {}


class ClientUserLoadingState extends ClientChatState {}

class CheckUserErrorState extends ClientChatState {
  final String? message;

  CheckUserErrorState({this.message});
}


class CheckClientUserLoadedState extends ClientChatState {
  final  List<MessagesModel>? message;
  final bool? isUserOnline;
  final bool?isUserTyping;

  CheckClientUserLoadedState({this.message,this.isUserTyping,this.isUserOnline});
}


class ClientSendMessageError extends ClientChatState{
 final String message;
  ClientSendMessageError({required this.message});
}


