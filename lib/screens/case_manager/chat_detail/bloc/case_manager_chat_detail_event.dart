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
  final List<MessagesModel> messages;
  ReceiveMessageEvent({required this.messages});

}







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






class SendMessageEvent extends CaseManagerChatDetailEvent {
  final String senderId;
  final String receiverId;
  final String message;
  final String sendBy;
  final String roomId;
  SendMessageEvent({required this.sendBy,required this.senderId,required this.receiverId,required this.message,required this.roomId});
}

class UserOnlineEvent extends CaseManagerChatDetailEvent {
  final bool isOnline;
  UserOnlineEvent(this.isOnline);
}
class UserOfflineEvent extends CaseManagerChatDetailEvent {
  final bool isOffline;
  UserOfflineEvent(this.isOffline);
}


class UserTypingEventAPI extends CaseManagerChatDetailEvent{
 final String? roomID;
 final String ?clientId;
  UserTypingEventAPI({this.roomID,this.clientId});
}

class UserOnlineEventApi extends CaseManagerChatDetailEvent{
  final String ?userID;
  final String ?roomID;
  final String ? status;
  UserOnlineEventApi({this.roomID,this.status,this.userID});
}
class TypingUserEvent extends CaseManagerChatDetailEvent {
  final bool? isTyping;

  TypingUserEvent({this.isTyping});
}
