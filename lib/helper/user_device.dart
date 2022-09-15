import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:retry/retry.dart';

import '../utils/api.dart';
import '../utils/constant.dart';

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

Future<Map?> getRefreshToken() async {
  final token = await secureStorage.read(key: clientToken);

  final Map<String, dynamic> headers = {};
  if (token != null) headers['Authorization'] = 'Bearer $token';
  var response =
      await http.post(Uri.parse(mainUrl + apiRefreshToken), headers: {
    'Authorization': 'Bearer $token',
  });

  var responseBody = json.decode(response.body);
  if (response.statusCode == 200) {
    GetIt.I<FlutterSecureStorage>()
        .write(key: clientToken, value: responseBody['data']['token']);
    GetIt.I<FlutterSecureStorage>().write(
        key: clientTokenUserId,
        value: responseBody['data']['user']['id'].toString());
    return responseBody;
  } else {
    return responseBody;
  }
}

Future<Map?> getProfiles() async {
  final token = await secureStorage.read(key: clientToken);

  final Map<String, dynamic> headers = {};
  if (token != null) headers['Authorization'] = 'Bearer $token';
  var response = await http.get(Uri.parse(mainUrl + profilUrl), headers: {
    'Authorization': 'Bearer $token',
  });

  var responseBody = json.decode(response.body);
  if (response.statusCode == 200) {
    return responseBody;
  } else {
    return responseBody;
  }
}
