
import 'dart:convert';
import 'dart:developer';

import 'package:chat/infrastructure/utils/app_common_widgets.dart';
import 'package:chat/screens/chat_detail/bloc/case_manager_chat_detail_bloc.dart';
import 'package:chat/screens/chat_detail/data/model/get_chat_model.dart';
import 'package:chat/screens/chat_detail/data/model/receive_chat_model.dart';
import 'package:chat/screens/chat_detail/data/repo/case_manager_chat_detail_repo.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class PusherService {
   PusherChannelsFlutter? pusher;
    ChatDetailBloc ?bloc;


  Future<void> init(String roomId,String caseManagerId,String clientID,String roomID) async {
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
          bloc?.add(UserOnlineEvent(true));
          final newMessage = MessagesModel.fromJson(data);
          logWithColor("newMessage ${newMessage.sendBy}");
          if(newMessage.senderId =="client12"){
            final currentMessages = bloc?.state is CheckUserLoadedState
                ? ( bloc?.state as CheckUserLoadedState).message as List<MessagesModel>
                : <MessagesModel>[];

              final updatedMessages = [


                ...currentMessages,
                MessagesModel(
                  msg: newMessage.msg,
                  senderId: newMessage.senderId,
                  receiverId: newMessage.receiverId,
                  sendBy: newMessage.sendBy,
                  status: newMessage.status,
                  id: newMessage.id,
                  unread: newMessage.unread,
                  dateTime: newMessage.dateTime,
                ),
              ];

              // Emit updated state
            bloc?.add(ReceiveMessageEvent(messages: updatedMessages));
          }

        } else if (event.eventName == 'chat-typing') {

          // bloc?.add(UserOnlineEvent(true));
          if(data["clientId"]=="client12"){
            // bloc?.add(TypingUserEvent(isTyping: true));
          }
        } else if (event.eventName == 'user-status') {
          if(data["message"]=="User Offline"){

            bloc?.add(TypingUserEvent(isTyping: false));
          }else{
            bloc?.add(UserOnlineEvent(true));
          }

        } else if (event.eventName == 'user_offline') {
          bloc?.add(UserOfflineEvent(true));
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
