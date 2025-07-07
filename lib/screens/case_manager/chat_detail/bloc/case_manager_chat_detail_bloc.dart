import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:endeavors/infrastructure/utils/app_common_widgets.dart';
import 'package:endeavors/screens/case_manager/chat_detail/data/model/add_new_user_model.dart';
import 'package:endeavors/screens/case_manager/chat_detail/data/model/case_manager_chat_message_model.dart';
import 'package:endeavors/screens/case_manager/chat_detail/data/model/check_user_model.dart';
import 'package:endeavors/screens/case_manager/chat_detail/data/repo/case_manager_chat_detail_repo.dart';
import 'package:endeavors/screens/case_manager/chat_detail/data/repo/chat_pusher_service.dart';
import 'package:meta/meta.dart';

part 'case_manager_chat_detail_event.dart';

part 'case_manager_chat_detail_state.dart';

class CaseManagerChatDetailBloc
    extends Bloc<CaseManagerChatDetailEvent, CaseManagerChatDetailState> {
  final CaseManagerChatDetailRepository caseManagerChatDetailRepository;
  final PusherService pusherService;
  List<CaseManagerChatMessageModel> messages = [];

  CaseManagerChatDetailBloc(
      this.caseManagerChatDetailRepository, this.pusherService)
      : super(CaseManagerChatDetailInitial()) {
    on<CheckUserEvent>(_checkUserApiFun);
    on<UserTyping>(_onUserTyping);
    on<OnlineUser>(_onOnlineUser);
    on<ReceiveMessageEvent>(_onReceiveMessage);
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
    CheckUserModel? checkUserModel = await caseManagerChatDetailRepository.checkUserApi();


    if (checkUserModel != null) {
      if(checkUserModel.userId !=""){
        final addNewUser =   await caseManagerChatDetailRepository.addNewUser(event.userId,
            event.name, event.role, event.email, event.phone, event.password);
        logWithColor("this worling",color: "\x1B[33m");
        emit(AddNewUserAddedState(addNewUserModel: addNewUser));
      }
      emit(CheckUserLoadedState(checkUserModel: checkUserModel));
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


  _onReceiveMessage(
      ReceiveMessageEvent event, Emitter<CaseManagerChatDetailState> emit) {
    messages.add(event.messageModel);
    emit(ChatUpdatedState(List.from(messages)));
  }

  Future<void> initializePusher() async {
    await pusherService.initPusher((messages) {
      add(ReceiveMessageEvent(messageModel: messages));
    }, (userId) {
      add(UserTyping(isTyping: true));
    }, (userId) {
      add(OnlineUser(isOnline: true));
    });
  }

  Future<void>disConnect()async{
    await pusherService.disConnectPusher();
  }
}
