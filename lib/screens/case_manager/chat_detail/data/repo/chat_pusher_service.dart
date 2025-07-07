import 'dart:convert';
import 'dart:developer';

import 'package:endeavors/screens/case_manager/chat_detail/data/model/case_manager_chat_message_model.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class PusherService {
  late PusherChannelsFlutter pusher;

  Future<void> initPusher(Function(CaseManagerChatMessageModel) onMessage,
      Function(bool) onTyping, Function(bool) onOnlineUser) async {
    pusher = PusherChannelsFlutter.getInstance();
    await pusher.init(
        apiKey: "b32df83bd6e66412e95f",
        cluster: "ap2",
        onEvent: (PusherEvent event) {
          log("🔔 [EVENT] ${event.eventName}: ${event.data}");

          if (event.eventName == 'new-message') {
            final jsonData = jsonDecode(event.data!);
            // final msg = Message.fromJson(jsonData);
            log("message $jsonData");
            onMessage(CaseManagerChatMessageModel.fromJson(jsonData));
          } else if (event.eventName == 'typing-event' && event.data != null) {
            final jsonData = jsonDecode(event.data!);
            log("typing $jsonData");
            onTyping(true);
          }
        });
    await pusher.subscribe(channelName: "chat-channel");
    await pusher.connect();
  }


  Future<void> disConnectPusher() async {
    log("pusher is disconnect");
    await pusher.disconnect();
  }
}
