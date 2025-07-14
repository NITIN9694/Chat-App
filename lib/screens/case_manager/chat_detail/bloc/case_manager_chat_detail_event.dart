part of 'case_manager_chat_detail_bloc.dart';

@immutable
sealed class CaseManagerChatDetailEvent {}


class SendNewMessageEvent extends CaseManagerChatDetailEvent {
  final String text;
  SendNewMessageEvent(this.text);
}

class CheckUser extends CaseManagerChatDetailEvent {}

class UserTyping extends CaseManagerChatDetailEvent {
  final bool? isTyping;

  UserTyping({this.isTyping});
}

class ReceiveMessageEvent extends CaseManagerChatDetailEvent {


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

  final String caseMangerId;
  final String caseManagerName;
  final String clientId;
  final String clientName;


  CheckUserEvent({

    required this.caseMangerId,
    required this.caseManagerName,
    required this.clientId,
    required this.clientName,
  });
}




class NewMessageReceived extends CaseManagerChatDetailEvent {
  final MessagesModel message;
  NewMessageReceived(this.message);
}
class TypingEvent extends CaseManagerChatDetailEvent {
  final String userId;
  TypingEvent(this.userId);
}
class SendMessageEvent extends CaseManagerChatDetailEvent {
  final String senderId;
  final String receiverId;
  final String message;
  final String sendBy;
  SendMessageEvent({required this.sendBy,required this.senderId,required this.receiverId,required this.message});
}

class UserOnlineEvent extends CaseManagerChatDetailEvent {
  final String userId;
  UserOnlineEvent(this.userId);
}
class UserOfflineEvent extends CaseManagerChatDetailEvent {
  final String userId;
  UserOfflineEvent(this.userId);
}





