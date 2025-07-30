
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:chat/screens/case_manager/chat_detail/data/model/add_new_user_model.dart';
import 'package:chat/screens/chat_detail/data/model/get_chat_model.dart';
import 'package:chat/screens/chat_detail/data/model/check_user_model.dart';
import 'package:chat/screens/chat_detail/data/model/pusher_trigger_model.dart';
import 'package:chat/screens/chat_detail/data/model/send_message_model.dart';
import 'package:chat/screens/chat_detail/data/repo/case_manager_chat_detail_repo.dart';
import 'package:chat/screens/chat_detail/data/repo/chat_pusher_service.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'case_manager_chat_detail_event.dart';

part 'case_manager_chat_detail_state.dart';

class ChatDetailBloc extends Bloc<CaseManagerChatDetailEvent, CaseManagerChatDetailState> {
  final CaseManagerChatDetailRepository caseManagerChatDetailRepository;
  PusherService? pusherService;
  String roomId ="";
  String caseManagerId ="";
  String clientID ="";

  final MessagesModel messageModelData = MessagesModel();
  List<MessagesModel>? message;

  ChatDetailBloc(
      this.caseManagerChatDetailRepository, this.pusherService)
      : super(CaseManagerChatDetailInitial()) {
    pusherService?.bloc = this;
    on<CheckUserEvent>(_checkUserApiFun);

    on<SendMessageEvent>(_onSendMessage);
    on<ReceiveMessageEvent>((event, emit) {
      emit(CheckUserLoadedState(message: event.messages,isUserTyping: false,isUserOnline: true));
    });

    on<UserOnlineEvent>((event, emit) {
      emit(CheckUserLoadedState(
        message: message ?? [],
        isUserOnline: true,
        isUserTyping: false,
      ));
    });

    on<UserOfflineEvent>((event, emit) {
      emit(CheckUserLoadedState(
        message: message ?? [],
        isUserOnline: false,
        isUserTyping: false,
      ));
    });

    on<TypingUserEvent>((event, emit) async {
      emit(CheckUserLoadedState(
        message: message ?? [],
        isUserOnline: true,
        isUserTyping: true,
      ));

      // Auto-remove typing after 3 seconds
      await Future.delayed(Duration(seconds: 5));
      emit(CheckUserLoadedState(
        message: message ?? [],
        isUserOnline: true,
        isUserTyping: false,
      ));
    });

    //typing pusher
    on<UserTypingEventAPI>(_userTypingApiFun);

    //online offline pusher
    on<UserOnlineEventApi>(_userOnlineOfflineApiFunc);
  }

  void _checkUserApiFun(
      CheckUserEvent event, Emitter<CaseManagerChatDetailState> emit) async {
    emit(CheckUserLoadingState());
    CheckUserModel? checkUserModel =
        await caseManagerChatDetailRepository.checkUserApi(
            event.caseMangerId,
            event.caseManagerName,
            event.clientId,
            event.clientName);
    if (checkUserModel != null) {

      CreateRoomModel? createRoomModel = await caseManagerChatDetailRepository
          .createRoomID(event.caseMangerId, event.clientId);
      if (createRoomModel != null) {
        GetChatModel? userChatModel = await caseManagerChatDetailRepository
            .getChatMessageApi(createRoomModel.roomID, 0, 10);
        roomId = createRoomModel.roomID;
        caseManagerId = event.caseMangerId;
        clientID = event.clientId;
        pusherService?.init("chatApp", event.caseMangerId, event.clientId, createRoomModel.roomID).then((_)async{
         await  caseManagerChatDetailRepository.triggerOnline(roomId, caseManagerId, "online");

        });
        if (userChatModel != null) {
          message = userChatModel.messages ?? [];
        }
      }


      emit(CheckUserLoadedState(message: message));
    } else {
      emit(CheckUserErrorState(message: "Something went wrong"));
    }
  }


  void _userTypingApiFun(UserTypingEventAPI event,Emitter<CaseManagerChatDetailState>emit)async{
    PusherTriggerModel ? pusherTriggerModel = await caseManagerChatDetailRepository.triggerTyping(event.roomID??"", event.clientId??"");
  }

  void _userOnlineOfflineApiFunc(UserOnlineEventApi event,Emitter<CaseManagerChatDetailState>emit)async{
   PusherTriggerModel ? pusherTriggerModel =  await caseManagerChatDetailRepository.triggerOnline(event.roomID??"", event.userID??"", event.status??"");
  }

  Future<void> disConnect() async {
    await pusherService?.disConnectPusher();

    await caseManagerChatDetailRepository.triggerOnline(roomId, caseManagerId, "offline");
  }

  void _onSendMessage(
      SendMessageEvent event, Emitter<CaseManagerChatDetailState> emit) async {
    // emit(SendMessageLoading());
    final currentMessages = state is CheckUserLoadedState
        ? (state as CheckUserLoadedState).message as List<MessagesModel>
        : <MessagesModel>[];

    SendMessageModel? userChatModelMessages =
        await caseManagerChatDetailRepository.sendMessageApi(
          event.roomId,
            event.senderId, event.receiverId, event.message, event.sendBy,);
    if (userChatModelMessages != null) {
      final updatedMessages = [

        ...currentMessages,

        MessagesModel(
          msg: userChatModelMessages.saveResult?.msg,
          senderId: userChatModelMessages.saveResult?.senderId,
          receiverId: userChatModelMessages.saveResult?.receiverId,
          sendBy: userChatModelMessages.saveResult?.sendBy,
          status: userChatModelMessages.saveResult?.status,
          id: userChatModelMessages.saveResult?.id,
          dateTime: userChatModelMessages.saveResult?.dateTime,
        ),
      ];

      log("this working ${jsonEncode(updatedMessages)}");

      emit(CheckUserLoadedState(message: updatedMessages));
    }
  }
}
