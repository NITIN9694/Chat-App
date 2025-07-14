import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:endeavors/infrastructure/utils/app_common_widgets.dart';
import 'package:endeavors/screens/case_manager/chat_detail/data/model/add_new_user_model.dart';
import 'package:endeavors/screens/case_manager/chat_detail/data/model/case_manager_chat_message_model.dart';
import 'package:endeavors/screens/case_manager/chat_detail/data/model/chat_model.dart';
import 'package:endeavors/screens/case_manager/chat_detail/data/model/check_user_model.dart';
import 'package:endeavors/screens/case_manager/chat_detail/data/model/message_model.dart';
import 'package:endeavors/screens/case_manager/chat_detail/data/repo/case_manager_chat_detail_repo.dart';
import 'package:endeavors/screens/case_manager/chat_detail/data/repo/chat_pusher_service.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'case_manager_chat_detail_event.dart';

part 'case_manager_chat_detail_state.dart';

class CaseManagerChatDetailBloc
    extends Bloc<CaseManagerChatDetailEvent, CaseManagerChatDetailState> {
    final CaseManagerChatDetailRepository caseManagerChatDetailRepository;
    final PusherService pusherService;
    final MessageModel  messageModelData = MessageModel();
    List<UserChatModelMessages>? message;
  CaseManagerChatDetailBloc(
      this.caseManagerChatDetailRepository, this.pusherService)
      : super(CaseManagerChatDetailInitial()) {
    on<CheckUserEvent>(_checkUserApiFun);

    on<SendMessageEvent>(_onSendMessage);

  }

   void _addNewUserApiFunc(  AddNewUserEvent event, Emitter<CaseManagerChatDetailState> emit)async{
     emit(CheckUserLoadingState());
     final addNewUser = await caseManagerChatDetailRepository.addNewUser(event.userId,
         event.name, event.role, event.email, event.phone, event.password);
     if (addNewUser != null) {
       emit(AddNewUserAddedState(addNewUserModel: addNewUser));
     } else {
       emit(CheckUserErrorState(message: "Something went wrong"));
     }
   }


   void _checkUserApiFun(
      CheckUserEvent event, Emitter<CaseManagerChatDetailState> emit) async {
    emit(CheckUserLoadingState());
    CheckUserModel? checkUserModel = await caseManagerChatDetailRepository.postCheckUserApi(event.caseMangerId,event.caseManagerName,event.clientId,event.clientName);


    if (checkUserModel != null) {

        CreateRoomModel? createRoomModel = await caseManagerChatDetailRepository.createRoomID(event.caseMangerId,event.clientId);
        if(createRoomModel !=null){
          UserChatModel? userChatModel = await caseManagerChatDetailRepository.getChats("cl001_cm001", 1, 10);
          if(userChatModel !=null){
            message = userChatModel.messages??[];
          }

         }

      emit(CheckUserLoadedState(message: message));
    } else {
      emit(CheckUserErrorState(message: "Something went wrong"));
    }
  }

  _onUserTyping(UserTyping event, Emitter<CaseManagerChatDetailState> emit) {
    emit(CaseManagerUserTypingState(isUserTyping: event.isTyping!));
  }

  _onOnlineUser(OnlineUser event,Emitter<CaseManagerChatDetailState>emit){
    emit(CaseManagerUserOnlineState(isUserOnline: event.isOnline!));
  }




  Future<void> initializePusher(String roomId) async {
    await pusherService.init(roomId);
  }

  Future<void>disConnect()async{
    await pusherService.disConnectPusher();
  }



  void _onSendMessage(SendMessageEvent event, Emitter<CaseManagerChatDetailState> emit) async{
  // emit(SendMessageLoading());
    SendMessageModel? userChatModelMessages = await caseManagerChatDetailRepository.sendMessageApi(event.senderId, event.receiverId, event.message, event.sendBy);
  if(userChatModelMessages !=null){

    final updatedMessages = [...?message, UserChatModelMessages(
      message: userChatModelMessages.messages?.last.message,
      senderId: userChatModelMessages.messages?.last.senderId,
      receiverId: userChatModelMessages.messages?.last.receiverId,
      sendBy: userChatModelMessages.messages?.last.sendBy,
      status: userChatModelMessages.messages?.last.status,
      sId: userChatModelMessages.messages?.last.sId,
      timestamp: userChatModelMessages.messages?.last.timestamp,


    )];

    emit(CheckUserLoadedState(message:updatedMessages));
  }else{
   emit(  SendMessageError(message: "Something went wrong"));
   }

  }
}
