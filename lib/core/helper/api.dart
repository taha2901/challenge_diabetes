import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://diabetes.runasp.net/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };

    try {
      return await dio!.get(
        url,
        queryParameters: query,
      );
    } on DioError catch (e) {
      print('Error: ${e.response?.statusCode} - ${e.message}');
      print('Response data: ${e.response?.data}');
      throw e;
    }
  }

  Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    dynamic data,
    bool isMultipart = false,
    String lang = 'ar',
    String? token,
  }) async {
    dio?.options.headers = {
      'Content-Type': isMultipart ? 'multipart/form-data' : 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };

    try {
      var response = await dio!.post(
        url,
        queryParameters: query,
        data: data,
      );
      return response;
    } on DioError catch (e) {
      debugPrint('Error: ${e.response?.statusCode} - ${e.message}');
      if (e.response != null) {
        debugPrint('Response data: ${e.response?.data}');
      }
      throw e;
    }
  }

    Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    dynamic data,
    String lang = 'ar',
    String? token,
  }) async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };

    try {
      var response = await dio!.delete(
        url,
        queryParameters: query,
        data: data,
      );
      return response;
    } on DioError catch (e) {
      debugPrint('Error: ${e.response?.statusCode} - ${e.message}');
      if (e.response != null) {
        debugPrint('Response data: ${e.response?.data}');
      }
      throw e;
    }
  }


  Future<Response> addData(
      {required String url,
      required Map<String, dynamic> body,
      required String Contenttype,
      required String token}) async {
    Response<dynamic> response;

    Options option = Options(
      headers: {'Content-Type': Contenttype, 'Authorization': 'Bearer $token'},
      validateStatus: (status) => true,
    );
    try {
      response = await Dio().post(
        url,
        data: body,
        options: option,
      );
      return response;
    } on DioException catch (e) {
      throw e;
    } catch (e) {
      debugPrint(e);
      throw e;
    }
  }

  Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'ar',
    String? token,
  }) async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };

    try {
      return await dio!.put(
        url,
        queryParameters: query,
        data: data,
      );
    } on DioError catch (e) {
      debugPrint('Error: ${e.response?.statusCode} - ${e.message}');
      throw e;
    }
  }

  Future<Response> fetchData(
      {required String url, required String token}) async {
    Response response;
    try {
      Options options = Options(headers: {'Authorization': 'Bearer $token'});
      response = await Dio().get(url, options: options);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> uploadImage({
    required String url,
    required File image,
    String lang = 'ar',
    String? token,
  }) async {
    dio?.options.headers = {
      'Content-Type': 'multipart/form-data',
      'lang': lang,
      'Authorization': token ?? '',
    };

    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(image.path,
          filename: image.path.split('/').last),
    });

    try {
      var response = await dio!.post(
        url,
        data: formData,
      );
      debugPrint('Response: ${response.data}');
      return response;
    } on DioError catch (e) {
      debugPrint('Error: ${e.response?.statusCode} - ${e.message}');
      if (e.response != null) {
        debugPrint('Response data: ${e.response?.data}');
      }
      throw e;
    }
  }
}

