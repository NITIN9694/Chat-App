import 'dart:developer';
import 'dart:io';

import 'package:endeavors/infrastructure/api_service/api_constant.dart';
import 'package:endeavors/infrastructure/api_service/api_provider.dart';
import 'package:endeavors/infrastructure/utils/app_toast.dart';
import 'package:endeavors/screens/case_manager/chat_detail/data/model/add_new_user_model.dart';
import 'package:endeavors/screens/case_manager/chat_detail/data/model/check_user_model.dart';

class CaseManagerChatDetailRepository {
  Future<CheckUserModel?> checkUserApi() async {
    try {
      Map<String,dynamic> params = {
        "":""
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
}
