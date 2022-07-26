import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:lectro/services/dio_service.dart';
import 'package:lectro/utils/constant.dart';

import '../services/navigation.dart';
import 'auth_repository.dart';

class MainRepository {
  MainRepository() {
    _init();
  }
}

_init() async {
  final isLoggedIn = await setConfig('id');

  if (isLoggedIn) {
    final auth = AuthRepository();
    auth.setFCM();
    GetIt.I<NavigationServiceMain>().pushReplacementNamed('/monitor');
  } else {
    GetIt.I<NavigationServiceMain>().pushReplacementNamed('/login');
  }
}

Future<bool> setConfig(String lang) async {
  Dio dio = _setupDio(lang);
  DIService.initializeConfig(dio);

  await _setupLocalNotification();
  await FirebaseMessaging.instance.requestPermission();
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);
  await _setupFCM();
  return await _isLoggedIn();
}

Dio _setupDio(String lang) {
  BaseOptions options = BaseOptions(
      baseUrl: FlavorConfig.instance.variables["baseUrl"],
      connectTimeout: 8000,
      receiveTimeout: 8000,
      sendTimeout: 8000,
      headers: {
        'accept': 'application/json',
        'X-Localization': lang,
      });

  Dio dio = Dio(options);

  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (HttpClient client) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  };

  dio.interceptors.add(LogInterceptor(
    responseBody: true,
    error: true,
    request: true,
    requestBody: true,
  ));

  return dio;
}

Future _isLoggedIn() async {
  final secureStorage = GetIt.I<FlutterSecureStorage>();
  final token = await secureStorage.read(key: clientToken);
  return token != null;
}

Future _setupLocalNotification() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings();

  InitializationSettings initializationSettings = const InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

  await GetIt.I<FlutterLocalNotificationsPlugin>().initialize(
      initializationSettings,
      onSelectNotification: _selectNotification);

  if (Platform.isAndroid) {
    await GetIt.I<FlutterLocalNotificationsPlugin>()
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .createNotificationChannel(androidChannel);
  }
}

/// Create a [AndroidNotificationChannel] for heads up notifications
AndroidNotificationChannel androidChannel = const AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  // 'This channel is used for important notifications.', // description
  importance: Importance.high,
  enableVibration: true,
  playSound: true,
);

Future _selectNotification(String? payload) async {
  if (payload != null) {
    if (kDebugMode) {
      print('notification payload: $payload');
    }

    return GetIt.I<NavigationServiceMain>()
        .pushReplacementNamed('/notification');
  }
}

_setupFCM() {
  FirebaseMessaging.onBackgroundMessage(backgroundMsgHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      GetIt.I<FlutterLocalNotificationsPlugin>().show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
                androidChannel.id, androidChannel.name),
          ));
    }
  });
}

Future<dynamic> backgroundMsgHandler(RemoteMessage msg) async {
  //use package firebase core
  await Firebase.initializeApp();
}
