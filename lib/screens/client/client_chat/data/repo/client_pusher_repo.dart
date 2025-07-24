
import 'dart:convert';
import 'dart:developer';

import 'package:endeavors/infrastructure/utils/app_common_widgets.dart';
import 'package:endeavors/screens/case_manager/chat_detail/data/model/get_chat_model.dart';

import 'package:endeavors/screens/client/client_chat/bloc/client_chat_bloc.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class ClientPusherService {
  PusherChannelsFlutter? pusher;
  ClientChatBloc ?bloc;


  Future<void> init(String roomId,String caseManagerId,String clientID) async {
    pusher = PusherChannelsFlutter.getInstance();
    await pusher?.init(
      apiKey: "d0b815acacfb926c5dd7",
      cluster: "ap2",
      onConnectionStateChange: (previousState, currentState) {
        logWithColor("Pusher connection changed from $previousState to $currentState");
      },
      onError: (message, code, exception) {
        logWithColor("Pusher error: $message (code: $code)", color: '\x1B[31m');
      },
      onEvent: (PusherEvent event) {
        final data = json.decode(event.data);
        logWithColor('Event Name: ${event.eventName}', color: '\x1B[36m');
        logWithColor('Event Data: $data', color: '\x1B[36m');

        if (event.eventName == 'chat-event') {
          // Extract actual message model from it
          bloc?.add(ClientUserOnlineEvent(true));
          final newMessage = MessagesModel.fromJson(data);
          logWithColor("newMessage ${newMessage.sendBy}");
          if(newMessage.senderId =="client12"){
            final currentMessages = bloc?.state is CheckClientUserLoadedState
                ? ( bloc?.state as CheckClientUserLoadedState).message as List<MessagesModel>
                : <MessagesModel>[];

            final updatedMessages = [

              MessagesModel(
                msg: newMessage.msg,
                senderId: newMessage.senderId,
                receiverId: newMessage.receiverId,
                sendBy: newMessage.sendBy,
                status: newMessage.status,
                id: newMessage.id,
                dateTime: newMessage.dateTime,
              ),
              ...currentMessages,
            ];

            // Emit updated state
            bloc?.add(ClientReceiveMessageEvent(messages: updatedMessages));
          }

        } else if (event.eventName == 'chat-typing') {
          bloc?.add(ClientTypingUserEvent(isTyping: true));
          // bloc?.add(UserOnlineEvent(true));
        } else if (event.eventName == 'user-status') {
          bloc?.add(ClientUserOnlineEvent(true));
        } else if (event.eventName == 'user_offline') {
          bloc?.add(ClientUserOfflineEvent(true));
        }
      },
    );
    await pusher?.connect();
    logWithColor(roomId);

    try {
      await pusher?.subscribe(
        channelName: roomId,
        onSubscriptionSucceeded: (dynamic state) async{
          logWithColor('✅ Subscribed to channel: $roomId', color: '\x1B[32m');
        },
        onSubscriptionError: (dynamic message) {
          logWithColor('❌ Subscription failed: $message', color: '\x1B[31m');
        },
      );
    } catch (e) {
      logWithColor('❌ Subscription exception: $e', color: '\x1B[31m');
    }



  }





  Future<void> disConnectPusher() async {
    log("pusher is disconnect");
    await pusher?.disconnect();
  }
}
