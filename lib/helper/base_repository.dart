import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:lectro/utils/api.dart';
import 'package:lectro/utils/constant.dart';

import '../models/base_response.dart';
import 'package:retry/retry.dart';
import 'package:dio/dio.dart';

import '../models/meta.dart';
import 'exception.dart';

class BaseRepository {
  final Dio dio = GetIt.I<Dio>();
  final FlutterSecureStorage secureStorage = GetIt.I<FlutterSecureStorage>();

  Future<BaseResponse> post(
    String api, {
    Map<String, dynamic>? data,
    String jsonHead = 'data',
  }) async {
    try {
      final token = await secureStorage.read(key: clientToken);

      final Map<String, dynamic> headers = {};
      if (token != null) headers['Authorization'] = 'Bearer $token';

      final response = await retry(
        () => dio.post(
          api,
          data: json.encode(data),
          options: Options(responseType: ResponseType.json, headers: headers),
        ),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );

      return BaseResponse(
        statusCode: response.statusCode,
        data: response.data,
        message: response.data['message'],
      );
    } on DioError catch (e) {
      return ExceptionHelper(e).catchException();
    }
  }

  Future<BaseResponse> put(
    String api, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    String jsonHead = 'data',
  }) async {
    try {
      final token = await secureStorage.read(key: clientToken);

      final Map<String, dynamic> headers = {};
      if (token != null) headers['Authorization'] = 'Bearer $token';

      final response = await retry(
        () => dio.put(
          api,
          data: json.encode(data),
          queryParameters: queryParameters,
          options: Options(headers: headers),
        ),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );

      return BaseResponse(
        statusCode: response.statusCode,
        data: response.data,
        message: response.data['message'],
      );
    } on DioError catch (e) {
      return ExceptionHelper(e).catchException();
    }
  }

  Future<BaseResponse> fetchSignUp(
    String api, {
    Map<String, dynamic>? queryParams,
    String jsonHead = 'data',
    bool withHead = true,
  }) async {
    try {
      final response = await retry(
        () => dio.get(
          api,
          queryParameters: queryParams,
          options: Options(
            responseType: ResponseType.json,
          ),
        ),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );
      if (response.data['data']['token'] != null) {
        GetIt.I<FlutterSecureStorage>()
            .write(key: clientToken, value: response.data['data']['token']);
        GetIt.I<FlutterSecureStorage>().write(
            key: clientTokenUserId,
            value: response.data['data']['user']['id'].toString());
      }

      return BaseResponse(
        statusCode: response.statusCode,
        data: response.data['data'],
        message: response.data['notice'],
      );
    } on DioError catch (e) {
      return ExceptionHelper(e).catchException();
    }
  }

  Future<BaseResponse> login(
    String api, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await retry(
        () => dio.post(
          api,
          data: json.encode(data),
          queryParameters: queryParameters,
          options: Options(responseType: ResponseType.json),
        ),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );

      if (response.data['data']['token'] != null) {
        GetIt.I<FlutterSecureStorage>()
            .write(key: clientToken, value: response.data['data']['token']);
        GetIt.I<FlutterSecureStorage>().write(
            key: clientTokenUserId,
            value: response.data['data']['user']['id'].toString());
      }

      return BaseResponse(
        statusCode: response.statusCode,
        data: response.data['data'],
        message: response.data['message'],
      );
    } on DioError catch (e) {
      return ExceptionHelper(e).catchException();
    }
  }

  Future<BaseResponse> refreshToken() async {
    final token = await secureStorage.read(key: clientToken);
    try {
      final Map<String, dynamic> headers = {};
      if (token != null) headers['Authorization'] = 'Bearer $token';
      final response = await retry(
        () => dio.post(
          apiRefreshToken,
          options: Options(
            responseType: ResponseType.json,
            headers: headers,
          ),
        ),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );

      if (response.statusCode == 200) {
        GetIt.I<FlutterSecureStorage>()
            .write(key: clientToken, value: response.data['data']['token']);
        GetIt.I<FlutterSecureStorage>().write(
            key: clientTokenUserId,
            value: response.data['data']['user']['id'].toString());
        return BaseResponse(
          statusCode: response.statusCode,
          data: response.data['data'],
          message: response.data['message'],
        );
      } else {
        return BaseResponse(
          statusCode: response.statusCode,
          data: response.data['data'],
          message: response.data['message'],
        );
      }
    } on DioError catch (e) {
      return ExceptionHelper(e).catchException();
    }
  }

  Future<BaseResponse> signup(
    String api, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await retry(
        () => dio.post(
          api,
          data: json.encode(data),
          queryParameters: queryParameters,
          options: Options(responseType: ResponseType.json),
        ),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );

      if (response.data['data']['token'] != null) {
        GetIt.I<FlutterSecureStorage>()
            .write(key: clientToken, value: response.data['data']['token']);
        GetIt.I<FlutterSecureStorage>().write(
            key: clientTokenUserId,
            value: response.data['data']['user']['id'].toString());
      }
      return BaseResponse(
        statusCode: response.statusCode,
        data: response.data['data'],
        message: response.data['message'],
      );
    } on DioError catch (e) {
      return ExceptionHelper(e).catchException();
    }
  }

  Future<BaseResponse> fetch(
    String api, {
    Map<String, dynamic>? queryParams,
    String jsonHead = 'data',
    bool withHead = true,
  }) async {
    try {
      final token = await secureStorage.read(key: clientToken);
      final Map<String, dynamic> headers = {};

      if (token != null) headers['Authorization'] = 'Bearer $token';

      final res = await retry(
        () => dio.get(
          api,
          queryParameters: queryParams,
          options: Options(
            responseType: ResponseType.json,
            headers: headers,
          ),
        ),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );

      if (res.statusCode == 401) {
        refreshToken();

        final token = await secureStorage.read(key: clientToken);
        if (kDebugMode) {
          print(token);
        }
        return BaseResponse(
          statusCode: res.data['code'],
          data: withHead ? res.data[jsonHead] ?? res.data : res.data,
          message: res.data['message'],
          meta: withHead
              ? res.data['meta'] != null
                  ? Meta.fromJson(res.data['meta'])
                  : null
              : null,
        );
      } else {
        return BaseResponse(
          statusCode: res.statusCode,
          data: withHead ? res.data[jsonHead] ?? res.data : res.data,
          message: res.data['message'],
          meta: withHead
              ? res.data['meta'] != null
                  ? Meta.fromJson(res.data['meta'])
                  : null
              : null,
        );
      }
    } on DioError catch (e) {
      return ExceptionHelper(e).catchException();
    }
  }

  Future<BaseResponse> register(
    String api, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await retry(
        () => dio.post(
          api,
          data: json.encode(data),
          queryParameters: queryParameters,
          options: Options(responseType: ResponseType.json),
        ),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );
      if (response.data['data']['token'] != null) {
        GetIt.I<FlutterSecureStorage>()
            .write(key: clientToken, value: response.data['data']['token']);
      }

      return BaseResponse(
        statusCode: response.statusCode,
        data: response.data['data'],
        message: response.data['message'],
      );
    } on DioError catch (e) {
      return ExceptionHelper(e).catchException();
    }
  }

  Future fetching(
    String api, {
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final token = await secureStorage.read(key: clientToken);
      final Map<String, dynamic> headers = {};

      if (token != null) headers['Authorization'] = 'Bearer $token';

      final res = await retry(
        () => dio.get(
          api,
          queryParameters: queryParams,
          options: Options(
            responseType: ResponseType.json,
            headers: headers,
          ),
        ),
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );
      Map<String, dynamic> response = json.decode(res.data);

      if (res.statusCode == 200) {
        return response;
      }
      return response;
    } on DioError catch (e) {
      return ExceptionHelper(e).catchException();
    }
  }
}
