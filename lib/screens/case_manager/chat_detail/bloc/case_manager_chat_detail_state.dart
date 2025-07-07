part of 'case_manager_chat_detail_bloc.dart';

@immutable
sealed class CaseManagerChatDetailState {}

final class CaseManagerChatDetailInitial extends CaseManagerChatDetailState {}

class ChatInitial extends CaseManagerChatDetailState {}

class ChatLoading extends CaseManagerChatDetailState {}

class ChatLoaded extends CaseManagerChatDetailState {}

class ChatError extends CaseManagerChatDetailState {}

class CheckUserState extends CaseManagerChatDetailState {
  final CheckUserModel? checkUserModel;

  CheckUserState({this.checkUserModel});
}

class CheckUserLoadingState extends CaseManagerChatDetailState {}

class CheckUserErrorState extends CaseManagerChatDetailState {
  final String? message;

  CheckUserErrorState({this.message});
}

class CheckUserLoadedState extends CaseManagerChatDetailState {
  final CheckUserModel? checkUserModel;

  CheckUserLoadedState({this.checkUserModel});
}


class AddNewUserAddedState extends CaseManagerChatDetailState {
  final AddNewUserModel? addNewUserModel;

  AddNewUserAddedState({this.addNewUserModel});
}



class CaseManagerUserTypingState extends CaseManagerChatDetailState {
  final bool isUserTyping;

  CaseManagerUserTypingState({required this.isUserTyping});
}

class CaseManagerUserOnlineState extends CaseManagerChatDetailState {
  final bool isUserOnline;

  CaseManagerUserOnlineState({required this.isUserOnline});
}


class ChatUpdatedState extends CaseManagerChatDetailState {
  final List<CaseManagerChatMessageModel> messages;
  ChatUpdatedState(this.messages);
}