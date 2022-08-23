import 'dart:io';

import 'package:dio/dio.dart';
import 'package:lectro/utils/constant.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../models/base_response.dart';
import '../utils/alert_toast.dart';
import '../utils/api.dart';

class ExceptionHelper<T> {
  final DioError e;
  ExceptionHelper(this.e);

  Future<BaseResponse<T>> catchException() async {
    String message = '';
    int statusCode = 0;

    await Sentry.captureException(e, stackTrace: e.stackTrace);

    switch (e.type) {
      case DioErrorType.connectTimeout:
        message = kConnectionTimeout;
        statusCode = 500;
        break;
      case DioErrorType.sendTimeout:
        message = kConnectionTimeout;
        statusCode = 500;

        break;
      case DioErrorType.receiveTimeout:
        message = kConnectionTimeout;
        statusCode = 500;

        break;
      case DioErrorType.response:
        if (e.response == null) {
          return BaseResponse(
            message: kErrorCantReachServer,
            statusCode: 0,
          );
        }

        final eResponse = e.response!;
        final statusCode = e.response!.statusCode;
        // message = eResponse.data['data'][0]['message'] ?? kErrorException;

        if (statusCode == 422) {
          message =
              eResponse.data['data'][0]['message'] ?? eResponse.data['message'];
        } else if (statusCode == 400) {
          if (eResponse.requestOptions.path == registerUrl) {
            return BaseResponse(
              message: message,
              statusCode: statusCode,
              data: eResponse.data,
            );
          }
          if (eResponse.data['errors'] != null) {
            Map<String, dynamic> errors = eResponse.data['errors'];

            message = eResponse.data['errors'][errors.keys.first][0] ??
                eResponse.data['message'].first;
          } else if (eResponse.data['error'] is String) {
            message = eResponse.data['error'];
          } else if (eResponse.data['message'] != null) {
            message = eResponse.data['message'].first;
          }
        } else {
          message = eResponse.data['message'] ?? eResponse.data['message'];
        }

        break;
      case DioErrorType.cancel:
        message = kErrorException;
        statusCode = 500;

        break;
      case DioErrorType.other:
        if (e.error is SocketException) {
          message = kNoInternetConnection;
        } else {
          message = e.message;
        }
        statusCode = 500;

        break;
    }

    showTopError(message);
    return BaseResponse(
        message: message,
        statusCode: statusCode,
        data: e.response?.data['message'],
        redirectTo: e.response?.data['redirect_to']);
  }
}
