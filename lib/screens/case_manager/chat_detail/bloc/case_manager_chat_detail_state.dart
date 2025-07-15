part of 'case_manager_chat_detail_bloc.dart';

@immutable
sealed class CaseManagerChatDetailState {}

final class CaseManagerChatDetailInitial extends CaseManagerChatDetailState {}

class ChatInitial extends CaseManagerChatDetailState {}

class ChatLoading extends CaseManagerChatDetailState {}


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
  final  List<UserChatModelMessages>? message;
  final bool? isUserOnline;
  final bool?isUserTyping;

  CheckUserLoadedState({this.message,this.isUserTyping,this.isUserOnline});
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


class SendMessageLoading extends CaseManagerChatDetailState{

}
class SendMessageLoaded extends CaseManagerChatDetailState{
final UserChatModelMessages? userChatModelMessages;
SendMessageLoaded({this.userChatModelMessages});
}

class SendMessageError extends CaseManagerChatDetailState{
String message;
SendMessageError({required this.message});
}
