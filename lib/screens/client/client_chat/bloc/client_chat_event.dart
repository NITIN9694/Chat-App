part of 'client_chat_bloc.dart';

@immutable
sealed class ClientChatEvent {}


//check user events
class ClientUserEvent extends ClientChatEvent {

  final String caseMangerId;
  final String caseManagerName;
  final String clientId;
  final String clientName;

  ClientUserEvent({

    required this.caseMangerId,
    required this.caseManagerName,
    required this.clientId,
    required this.clientName,
  });


}


class ClientSendMessageEvent extends ClientChatEvent {
  final String senderId;
  final String receiverId;
  final String message;
  final String sendBy;
  final String roomId;
  ClientSendMessageEvent({required this.sendBy,required this.senderId,required this.receiverId,required this.message,required this.roomId});
}


class ClientUserOnlineEvent extends ClientChatEvent {
  final bool isOnline;
  ClientUserOnlineEvent(this.isOnline);
}
class ClientUserOfflineEvent extends ClientChatEvent {
  final bool isOffline;
  ClientUserOfflineEvent(this.isOffline);
}


class ClientTypingUserEvent extends ClientChatEvent {
  final bool? isTyping;

  ClientTypingUserEvent({this.isTyping});
}


class ClientReceiveMessageEvent extends ClientChatEvent {
  final List<MessagesModel> messages;
  ClientReceiveMessageEvent({required this.messages});

}
class ClientUserTypingEventAPI extends ClientChatEvent{
  final String? roomID;
  final String ?clientId;
  ClientUserTypingEventAPI({this.roomID,this.clientId});
}

class ClientUserOnlineEventApi extends ClientChatEvent{
  final String ?userID;
  final String ?roomID;
  final String ? status;
  ClientUserOnlineEventApi({this.roomID,this.status,this.userID});
}