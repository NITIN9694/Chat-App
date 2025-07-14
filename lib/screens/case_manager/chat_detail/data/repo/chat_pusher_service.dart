
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:endeavors/infrastructure/api_service/api_provider.dart';
import 'package:endeavors/screens/case_manager/chat_detail/bloc/case_manager_chat_detail_bloc.dart';
import 'package:endeavors/screens/case_manager/chat_detail/data/model/add_new_user_model.dart';
import 'package:endeavors/screens/case_manager/chat_detail/data/model/case_manager_chat_message_model.dart';
import 'package:endeavors/screens/case_manager/chat_detail/data/model/chat_model.dart';
import 'package:endeavors/screens/case_manager/chat_detail/data/model/message_model.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class PusherService {
  late PusherChannelsFlutter pusher;
  late final CaseManagerChatDetailBloc bloc;


  Future<void> init(String roomId) async {
    await pusher.init(
      apiKey: "d0b815acacfb926c5dd7",
      cluster: "ap2",
      onEvent: (event) {
        final data = json.decode(event.data);
        if (event.eventName == 'new_message') {
          bloc.add(NewMessageReceived(MessagesModel.fromJson(data)));
        } else if (event.eventName == 'typing') {
          bloc.add(TypingEvent(data['userId']));
        } else if (event.eventName == 'user_online') {
          bloc.add(UserOnlineEvent(data['userId']));
        } else if (event.eventName == 'user_offline') {
          bloc.add(UserOfflineEvent(data['userId']));
        }
      },
    );

    await pusher.connect();
    await pusher.subscribe(channelName: 'private-chat-$roomId');
  }



  Future<void> disConnectPusher() async {
    log("pusher is disconnect");
    await pusher.disconnect();
  }
}
