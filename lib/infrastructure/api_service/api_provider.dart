
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:endeavors/infrastructure/api_service/dioLogger.dart';
import 'package:endeavors/infrastructure/app_constant/app_constant.dart';
import 'package:endeavors/infrastructure/local_storage/pref_manager.dart';

import 'api_constant.dart';

class ApiProvider {
  Dio _dio = Dio();

  var apiEndPoints = ApiConstant();
  DioException? _dioError;

  ApiProvider.base() {
    BaseOptions dioOptions = BaseOptions()..baseUrl = ApiConstant().baseUrl;
    _dio = Dio(dioOptions);
    _dio.interceptors.add(
        InterceptorsWrapper(onRequest: (RequestOptions options, handler) async {
      options.headers = {'Content-Type': 'application/json'};
      DioLogger.onSend(ApiConstant().tag, options);
      return handler.next(options);
    }, onResponse: (Response response, handler) {
      DioLogger.onSuccess(ApiConstant().tag, response);
      return handler.next(response);
    }, onError: (DioException error, handler) {
      _dioError = error;
      DioLogger.onError(ApiConstant().tag, error);
      return handler.next(error);
    }));
  }

  ApiProvider.baseWithToken() {
    BaseOptions dioOptions = BaseOptions()..baseUrl = ApiConstant().baseUrl;
    _dio = Dio(dioOptions);
    _dio.interceptors.add(
        InterceptorsWrapper(onRequest: (RequestOptions options, handler) async {
      String accessToken =
          await PrefManager.getString(AppConstants.accessToken);

      options.headers = {'Content-Type': 'application/json'};
      options.headers = {'Authorization': 'Bearer $accessToken'};
      DioLogger.onSend(ApiConstant().tag, options);
      log("accessToken${options.headers}");
      return handler.next(options);
    }, onResponse: (Response response, handler) {
      DioLogger.onSuccess(ApiConstant().tag, response);
      return handler.next(response);
    }, onError: (DioException error, handler) {
      logOutUser();
      _dioError = error;
      DioLogger.onError(ApiConstant().tag, error);
      return handler.next(error);
    }));
  }

// Generic Get Api Function
  Future<T> getApiData<T>(
    String endpoint,
    T Function(dynamic) fromJson,
  ) async {
    try {
      log("endpoint ${endpoint}");
      Response res = await _dio.get(endpoint);
      return fromJson(res.data);
    } on DioException catch (e) {
      log('Error: ${e.response?.data ?? e.message}');
      rethrow;
    }
  }

  // Generic Post Function
  Future<T> postApiData<T>(
    String endpoint,
    Map<String, dynamic> params,
    T Function(dynamic) fromJson,
  ) async {
    try {
      var data = json.encode(params);
      log('POST Params: $data');
      log('POST Endpoint: $endpoint');

      Response response =
          await _dio.post(apiEndPoints.baseUrl + endpoint, data: data);
      return fromJson(response.data);
    } on DioException catch (e) {
      log('Error: ${e.response?.data ?? e.message}');
      rethrow;
    }
  }

  // Generic PATCH API Function
  Future<T> patchApiData<T>(
    String endpoint,
    Map<String, dynamic> params,
    T Function(dynamic) fromJson,
  ) async {
    try {
      var data = json.encode(params);
      log('PATCH Params: $data');
      log('PATCH Endpoint: $endpoint');

      Response response = await _dio.patch(endpoint, data: data);
      return fromJson(response.data);
    } on DioException catch (e) {
      log('Error: ${e.response?.data ?? e.message}');
      rethrow;
    }
  }

  // Generic DELETE API Function
  Future<T> deleteApiData<T>(
    String endpoint,
    Map<String, dynamic>? params,
    T Function(dynamic) fromJson,
  ) async {
    try {
      log('DELETE Params: $params');
      log('DELETE Endpoint: $endpoint');

      Response response = await _dio.delete(
        endpoint,
        data: params != null ? json.encode(params) : null,
      );
      return fromJson(response.data);
    } on DioException catch (e) {
      log('Error: ${e.response?.data ?? e.message}');
      rethrow;
    }
  }

  logOutUser() async {
    // PrefManager.remove(AppConstants.loggedIn);
    // PrefManager.remove(AppConstants.accessToken);
    // Get.offAllNamed(Routes.authScreen);
  }
}
