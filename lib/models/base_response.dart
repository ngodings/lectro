import 'meta.dart';

class BaseResponse<T> {
  final int? statusCode;
  final String? message;
  final Meta? meta;
  final T? data;
  final String? redirectTo;

  BaseResponse({
    this.message,
    this.meta,
    this.data,
    this.statusCode,
    this.redirectTo,
  });
}
