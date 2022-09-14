import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:retry/retry.dart';

import '../models/base_response.dart';
import '../utils/api.dart';
import '../utils/constant.dart';
import 'exception.dart';

final Dio dio = GetIt.I<Dio>();
final FlutterSecureStorage secureStorage = GetIt.I<FlutterSecureStorage>();

Future<String> getUserDevice() async {
  final token = await secureStorage.read(key: clientToken);

  try {
    final Map<String, dynamic> headers = {};
    if (token != null) headers['Authorization'] = 'Bearer $token';
    final response = await retry(
      () => dio.get(profilUrl,
          options: Options(
            responseType: ResponseType.json,
            headers: headers,
          )),
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );

    if (response.data['data']['access_devices'].length != null) {
      String? userDeviceID =
          response.data['data']['access_devices'][0]['id'].toString();
      GetIt.I<FlutterSecureStorage>()
          .write(key: clientDeviceId, value: userDeviceID);
    }

    return response.data['data']['access_devices'][0]['id'].toString();
  } on DioError catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
  return 'success';
}

Future refreshToken() async {
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
