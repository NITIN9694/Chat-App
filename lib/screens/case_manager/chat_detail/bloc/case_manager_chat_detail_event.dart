part of 'case_manager_chat_detail_bloc.dart';

@immutable
sealed class CaseManagerChatDetailEvent {}

class GetChat extends CaseManagerChatDetailEvent {}

class SendNewMessage extends CaseManagerChatDetailEvent {}

class CheckUser extends CaseManagerChatDetailEvent {}

class UserTyping extends CaseManagerChatDetailEvent {
  final bool? isTyping;

  UserTyping({this.isTyping});
}

class ReceiveMessageEvent extends CaseManagerChatDetailEvent {
  final CaseManagerChatMessageModel messageModel;

  ReceiveMessageEvent({required this.messageModel});
}

class MsgRead extends CaseManagerChatDetailEvent {}

class OnlineUser extends CaseManagerChatDetailEvent {
  final bool? isOnline;

  OnlineUser({this.isOnline});
}

class ReportUser extends CaseManagerChatDetailEvent {}

class GetUnreadMsg extends CaseManagerChatDetailEvent {}

class AddNewUserEvent extends CaseManagerChatDetailEvent {
  final int userId;
  final String name;
  final String role;
  final String email;
  final String phone;
  final String password;

  AddNewUserEvent({
    required this.userId,
    required this.name,
    required this.role,
    required this.email,
    required this.phone,
    required this.password,
  });
}

//check user events
class CheckUserEvent extends CaseManagerChatDetailEvent {
  final int userId;
  final String name;
  final String role;
  final String email;
  final String phone;
  final String password;

  CheckUserEvent({
    required this.userId,
    required this.name,
    required this.role,
    required this.email,
    required this.phone,
    required this.password,
  });
}
