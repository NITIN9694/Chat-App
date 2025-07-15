
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:endeavors/infrastructure/api_service/api_provider.dart';
import 'package:endeavors/infrastructure/utils/app_common_widgets.dart';
import 'package:endeavors/screens/case_manager/chat_detail/bloc/case_manager_chat_detail_bloc.dart';
import 'package:endeavors/screens/case_manager/chat_detail/data/model/add_new_user_model.dart';
import 'package:endeavors/screens/case_manager/chat_detail/data/model/case_manager_chat_message_model.dart';
import 'package:endeavors/screens/case_manager/chat_detail/data/model/chat_model.dart';
import 'package:endeavors/screens/case_manager/chat_detail/data/model/check_user_model.dart';
import 'package:endeavors/screens/case_manager/chat_detail/data/model/message_model.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class PusherService {
   PusherChannelsFlutter? pusher;
    CaseManagerChatDetailBloc ?bloc;


  Future<void> init(String roomId,String caseManagerId,String clientID) async {
    pusher = PusherChannelsFlutter.getInstance();
    await pusher?.init(
      apiKey: "d0b815acacfb926c5dd7",
      cluster: "ap2",
      authEndpoint:'https://cded0513a8b5.ngrok-free.app/api/chat/pusher/auth',
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

        if (event.eventName == 'new_message') {
          // Extract actual message model from it
          final newMessage = MessagesModel.fromJson(data);
          logWithColor("newMessage ${newMessage.sendBy}");
          if(newMessage.senderId =="cl001"){

            final lastMessage = UserChatModelMessages(
              message: newMessage.message,
              senderId: newMessage.senderId,
              receiverId: newMessage.receiverId,
              sendBy: newMessage.sendBy,
              status: newMessage.status,
              sId: newMessage.sId,
              timestamp: newMessage.timestamp,
            );

            // Add it to the current message list (ensure message list is not null)
            final updatedMessages = [...?bloc?.message, lastMessage];

            // Update the BLoC's local message list
            bloc?.message = updatedMessages;

            // Emit updated state
            bloc?.add(ReceiveMessageEvent(messages: updatedMessages));
          }

        } else if (event.eventName == 'typing') {
          bloc?.add(TypingUserEvent(isTyping: true));
        } else if (event.eventName == 'user_online') {
          bloc?.add(UserOnlineEvent(true));
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
        onSubscriptionSucceeded: (dynamic state) {
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
