import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:endeavors/screens/case_manager/chat_detail/data/model/get_chat_model.dart';
import 'package:endeavors/screens/case_manager/chat_detail/data/model/pusher_trigger_model.dart';
import 'package:endeavors/screens/case_manager/chat_detail/data/model/send_message_model.dart';
import 'package:endeavors/screens/client/client_chat/data/repo/client_chat_repo.dart';
import 'package:endeavors/screens/client/client_chat/data/repo/client_pusher_repo.dart';
import 'package:meta/meta.dart';

import '../../../case_manager/chat_detail/data/model/check_user_model.dart';

part 'client_chat_event.dart';
part 'client_chat_state.dart';

class ClientChatBloc extends Bloc<ClientChatEvent, ClientChatState> {
  ClientPusherService? pusherService;
  final MessagesModel messageModelData = MessagesModel();
  final ClientChatDetailRepository chatDetailRepository;
  List<MessagesModel>? message;
  String roomId ="";
  String caseManagerId ="";
  String clientID ="";

  ClientChatBloc(this.chatDetailRepository,this.pusherService) : super(ClientChatInitial()) {
     pusherService?.bloc= this;
      on<ClientUserEvent>(_checkUserApiFun);

      on<ClientSendMessageEvent>(_onSendMessage);
      on<ClientReceiveMessageEvent>((event, emit) {
        final currentState = state;
        emit(CheckClientUserLoadedState(
          message: event.messages,

        ));
      });

      on<ClientUserOnlineEvent>((event, emit) {
        emit(CheckClientUserLoadedState(
          message: message ?? [],
          isUserOnline: true,
          isUserTyping: true,
        ));
      });

      on<ClientUserOfflineEvent>((event, emit) {
        emit(CheckClientUserLoadedState(
          message: message ?? [],
          isUserOnline: false,
          isUserTyping: false,
        ));
      });

      on<ClientTypingUserEvent>((event, emit) async {
        emit(CheckClientUserLoadedState(
          message: message ?? [],
          isUserOnline: true,
          isUserTyping: true,
        ));

        // Auto-remove typing after 3 seconds
        await Future.delayed(Duration(seconds: 5));
        emit(CheckClientUserLoadedState(
          message: message ?? [],
          isUserOnline: true,
          isUserTyping: false,
        ));
      });

     //typing pusher
     on<ClientUserTypingEventAPI>(_userTypingApiFun);

     //online offline pusher
     on<ClientUserOnlineEventApi>(_userOnlineOfflineApiFunc);
  }

  void _checkUserApiFun(
      ClientUserEvent event, Emitter<ClientChatState> emit) async {
    emit(ClientUserLoadingState());
    CheckUserModel? checkUserModel =
    await chatDetailRepository.postCheckUserApi(
        event.caseMangerId,
        event.caseManagerName,
        event.clientId,
        event.clientName);
    if (checkUserModel != null) {

      CreateRoomModel? createRoomModel = await chatDetailRepository
          .createRoomID(event.caseMangerId, event.clientId);
      if (createRoomModel != null) {
        GetChatModel? userChatModel = await chatDetailRepository
            .getChatMessageApi(createRoomModel.roomID, 0, 10);
        roomId = createRoomModel.roomID;
        caseManagerId = event.caseMangerId;
        clientID = event.clientId;
        pusherService?.init("chatApp", event.caseMangerId, event.clientId).then((_)async{
          await  chatDetailRepository.triggerOnline(roomId, caseManagerId, "online");

        });
        if (userChatModel != null) {
          message = userChatModel.messages ?? [];
        }
      }


      emit(CheckClientUserLoadedState(message: message));
    } else {
      emit(CheckUserErrorState(message: "Something went wrong"));
    }
  }


  Future<void> initializePusher(String roomId) async {
    await pusherService?.init("cl001_cm001", "cm001", "cl001",);
  }

  Future<void> disConnect() async {
    await pusherService?.disConnectPusher();
    await chatDetailRepository.triggerOnline(roomId, caseManagerId, "offline");

  }



  void _userTypingApiFun(ClientUserTypingEventAPI event,Emitter<ClientChatState>emit)async{
    PusherTriggerModel ? pusherTriggerModel = await chatDetailRepository.triggerTyping(event.roomID??"", event.clientId??"");
  }

  void _userOnlineOfflineApiFunc(ClientUserOnlineEventApi event,Emitter<ClientChatState>emit)async{
    PusherTriggerModel ? pusherTriggerModel =  await chatDetailRepository.triggerOnline(event.roomID??"", event.userID??"", event.status??"");
  }


  void _onSendMessage(
      ClientSendMessageEvent event, Emitter<ClientChatState> emit) async {
     final currentMessages = state is CheckClientUserLoadedState
        ?
      (state as CheckClientUserLoadedState).message as List<MessagesModel>
        : <MessagesModel>[];
  SendMessageModel? userChatModelMessages =
      await chatDetailRepository.sendMessageApi(
      event.roomId,
      event.senderId, event.receiverId, event.message, event.sendBy,);
    if (userChatModelMessages != null) {
      final updatedMessages = [

        MessagesModel(
          msg: userChatModelMessages.messages?.last.msg,
          senderId: userChatModelMessages.messages?.last.senderId,
          receiverId: userChatModelMessages.messages?.last.receiverId,
          sendBy: userChatModelMessages.messages?.last.sendBy,
          status: userChatModelMessages.messages?.last.status,
          id: userChatModelMessages.messages?.last.id,
          dateTime: userChatModelMessages.messages?.last.dateTime,
        ),
        ...currentMessages,
      ];

      log("this working ${jsonEncode(updatedMessages)}");

      emit(CheckClientUserLoadedState(message: updatedMessages));
    }
  }
}
