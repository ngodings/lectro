import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:lectro/services/navigation.dart';

import 'user_service.dart';

class DIService {
  final serviceLocator = GetIt.instance;
  static void initialize() {
    GetIt.I.registerSingleton<NavigationServiceMain>(NavigationServiceMain());
    GetIt.I.registerSingleton<FluroRouter>(FluroRouter());
    GetIt.I
        .registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());

    GetIt.I.registerLazySingleton<FlutterLocalNotificationsPlugin>(
        () => FlutterLocalNotificationsPlugin());
    GetIt.I.registerSingleton<FirebaseMessaging>(FirebaseMessaging.instance);
  }

  static void initializeConfig(Dio dio) {
    GetIt.I.registerSingleton<UserService>(UserService());
    GetIt.I.registerSingleton<Dio>(dio);
  }
}
