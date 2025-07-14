import 'dart:developer';
import 'dart:io';

import 'package:endeavors/infrastructure/api_service/api_constant.dart';
import 'package:endeavors/infrastructure/api_service/api_provider.dart';
import 'package:endeavors/infrastructure/utils/app_toast.dart';
import 'package:endeavors/screens/case_manager/chat_detail/data/model/add_new_user_model.dart';
import 'package:endeavors/screens/case_manager/chat_detail/data/model/chat_model.dart';
import 'package:endeavors/screens/case_manager/chat_detail/data/model/check_user_model.dart';
import 'package:endeavors/screens/case_manager/chat_detail/data/model/message_model.dart';

class CaseManagerChatDetailRepository {
  Future<CheckUserModel?> checkUserApi(int userID) async {
    try {
      Map<String,dynamic> params = {
        "userId":userID
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

  Future<AddNewUserModel?> addNewUser(int userId,String name,String role,String email,String phone,String password)async{
    try {
      Map<String,dynamic> params = {
        "userId":userId,
        "name": name,
        "role":role,
        "email":email,
        "phone":phone,
        "password":password

      };

      AddNewUserModel checkUserModel =
      await ApiProvider.baseWithToken().postApiData(ApiConstant().addNewUser, params,AddNewUserModel.fromJson);

      return checkUserModel;
    } on HttpException catch (e) {
      log("HttpException:- $e");
    } catch (e) {
      log("Error:- $e");
    }
    return null;
  }

  Future<MessageModel?> getChatMessage(int caseManagerId,int pageNo,int pageSize,int clientID) async {
    try {
      Map<String,dynamic> params = {
        "caseManagerId":caseManagerId,
        "pageNo":pageNo,
        "pageSize":pageSize,
        "clientId":clientID
      };

      MessageModel messageModel =
      await ApiProvider.baseWithToken().postApiData(ApiConstant().getChat, params,MessageModel.fromJson);

      return messageModel;
    } on HttpException catch (e) {
      log("HttpException:- $e");
    } catch (e) {
      log("Error:- $e");
    }
    return null;
  }



  //node api

   Future<CheckUserModel?>postCheckUserApi(String caseManagerID,String caseManagerName,String clientId,String clientName)async{
    try{
      Map<String,dynamic> params = {
        "caseMangerId":caseManagerID ,
        "caseManagerName": caseManagerName,
        "clientId": clientId,
        "clientName": clientName
      };

      CheckUserModel checkUserModel =
          await ApiProvider.baseWithToken().postApiData(ApiConstant().nodeCheckUser, params,CheckUserModel.fromJson);

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
        "caseMangerId": caseManagerID,

      };

      CreateRoomModel createRoomModel =
      await ApiProvider.baseWithToken().postApiData(ApiConstant().nodeCreateUser, params,CreateRoomModel.fromJson);

      return createRoomModel;
    } on HttpException catch (e) {
      log("HttpException:- $e");
    } catch (e) {
      log("Error:- $e");
    }
    return null;
  }

  Future<UserChatModel?>getChats(String roomId,int page,int limit,)async{
    try{
      Map<String,dynamic> params = {


      };

      UserChatModel chatModel =
      await ApiProvider.baseWithToken().getApiFormData("${ApiConstant().nodeGetChat}roomId=$roomId&page=$page&limit=$limit", params,UserChatModel.fromJson);

      return chatModel;
    } on HttpException catch (e) {
      log("HttpException:- $e");
    } catch (e) {
      log("Error:- $e");
    }
    return null;
  }


  Future<SendMessageModel?>sendMessageApi(String senderId,String receiverId,String message,String sentBy)async{
    try{
      Map<String,dynamic> params = {
        "senderId": senderId,
        "receiverId": receiverId,
        "message": message,
        "sendBy": sentBy
      };

      SendMessageModel messagesModel =
      await ApiProvider.baseWithToken().postApiData(ApiConstant().nodeSendMessage, params,SendMessageModel.fromJson);

      return messagesModel;
    } on HttpException catch (e) {
      log("HttpException:- $e");
    } catch (e) {
      log("Error:- $e");
    }
    return null;
  }




  Future<GetChatModel?> getChatMessageApi(String caseManagerId,int pageNo,int pageSize) async {
    try {
      Map<String,dynamic> params = {
      };

      GetChatModel messageModel =
      await ApiProvider.baseWithToken().postApiData("/api/chat/get-chat-paginated?roomId=$caseManagerId&page=$pageNo&limit=$pageSize", params,GetChatModel.fromJson);

      return messageModel;
    } on HttpException catch (e) {
      log("HttpException:- $e");
    } catch (e) {
      log("Error:- $e");
    }
    return null;
  }


  Future<void> triggerTyping(String roomId, String userId)async{
    try {
      Map<String,dynamic> params ={"roomId": roomId, "userId": userId};
      ApiProvider.base().postApiData("/api/chat/typing", params,AddNewUserModel.fromJson);

    } on HttpException catch (e) {
      log("HttpException:- $e");
    } catch (e) {
      log("Error:- $e");
    }
    return;
  }



  Future<void> triggerOnline(String roomId, String userId, String status)async{
    try {
      Map<String,dynamic> params ={"roomId": roomId, "userId": userId, "status": status};
      ApiProvider.base().postApiData("/api/chat/status", params,AddNewUserModel.fromJson);

    } on HttpException catch (e) {
      log("HttpException:- $e");
    } catch (e) {
      log("Error:- $e");
    }
    return;
  }



}
