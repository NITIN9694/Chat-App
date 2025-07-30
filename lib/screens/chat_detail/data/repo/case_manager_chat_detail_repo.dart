import 'dart:developer';
import 'dart:io';

import 'package:chat/infrastructure/api_service/api_constant.dart';
import 'package:chat/infrastructure/api_service/api_provider.dart';
import 'package:chat/screens/case_manager/chat_detail/data/model/add_new_user_model.dart';
import 'package:chat/screens/chat_detail/data/model/get_chat_model.dart';
import 'package:chat/screens/chat_detail/data/model/check_user_model.dart';
import 'package:chat/screens/chat_detail/data/model/pusher_trigger_model.dart';
import 'package:chat/screens/chat_detail/data/model/send_message_model.dart';

class CaseManagerChatDetailRepository {


   Future<CheckUserModel?>checkUserApi(String caseManagerID,String caseManagerName,String clientId,String clientName)async{
    try{
      Map<String,dynamic> params = {
        "caseManagerId":caseManagerID ,
        "caseManagerName": caseManagerName,
        "clientId": clientId,
        "clientName": clientName
      };

      CheckUserModel checkUserModel =
          await ApiProvider.baseWithToken().postApiData(ApiConstant().checkUser, params,CheckUserModel.fromJson);

      return checkUserModel;
    } on HttpException catch (e) {
      log("HttpException:- $e");
    } catch (e) {
      log("Error:- $e");
    }
    return null;
   }


   Future<CreateRoomModel?>createRoomID(String caseManagerID,String clientId,)async{
    try{
      Map<String,dynamic> params = {
        "clientId":clientId ,
        "caseManagerId": caseManagerID,

      };

      CreateRoomModel createRoomModel =
      await ApiProvider.baseWithToken().postApiData(ApiConstant().createRoom, params,CreateRoomModel.fromJson);

      return createRoomModel;
    } on HttpException catch (e) {
      log("HttpException:- $e");
    } catch (e) {
      log("Error:- $e");
    }
    return null;
  }



  Future<SendMessageModel?>sendMessageApi(String roomId,String senderId,String receiverId,String message,String sentBy)async{
    try{
      Map<String,dynamic> params = {
        "senderId": senderId,
        "receiverId": receiverId,
        "message": message,
        "sendBy": sentBy
      };

      SendMessageModel messagesModel =
      await ApiProvider.baseWithToken().postApiData("${ApiConstant().sendNewMessage}?roomId=$roomId&page=12&limit=10", params,SendMessageModel.fromJson);

      return messagesModel;
    } on HttpException catch (e) {
      log("HttpException:- $e");
    } catch (e) {
      log("Error:- $e");
    }
    return null;
  }




  Future<GetChatModel?> getChatMessageApi(String roomID,int pageNo,int pageSize) async {
    try {

      GetChatModel messageModel =
      await ApiProvider.baseWithToken().getApiData("/get_chat?roomId=$roomID&page=12&limit=$pageSize",GetChatModel.fromJson);

      return messageModel;
    } on HttpException catch (e) {
      log("HttpException:- $e");
    } catch (e) {
      log("Error:- $e");
    }
    return null;
  }


  Future<PusherTriggerModel?> triggerTyping(String roomId, String userId)async{
    try {
      Map<String,dynamic> params ={"roomId": roomId, "clientId": userId};
      PusherTriggerModel pusherTriggerModel = await ApiProvider.base().postApiData(ApiConstant().userTyping, params,PusherTriggerModel.fromJson);
      return pusherTriggerModel;
    } on HttpException catch (e) {
      log("HttpException:- $e");
    } catch (e) {
      log("Error:- $e");
    }
    return null;

  }



  Future<PusherTriggerModel?> triggerOnline(String roomId, String userId, String status)async{
    try {
      Map<String,dynamic> params ={"roomId": roomId, "userId": userId, "status": status};
      PusherTriggerModel pusherTriggerModel = await  ApiProvider.base().postApiData(ApiConstant().onlineUser, params,PusherTriggerModel.fromJson);

    } on HttpException catch (e) {
      log("HttpException:- $e");
    } catch (e) {
      log("Error:- $e");
    }
   return null;
  }



}
