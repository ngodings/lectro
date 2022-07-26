import 'dart:async';
import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'app/main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0x19000000),
    statusBarIconBrightness: Brightness.dark,
  ));

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await Firebase.initializeApp();

  FlavorConfig(
    name: "STAGING",
    color: Colors.green,
    location: BannerLocation.topStart,
    variables: {
      "baseUrl": "https://ems.service.lectro.id",
      "username": "",
      "password": "",
    },
  );

  runZonedGuarded(
    () => runApp(
      EasyLocalization(
        startLocale: const Locale('en', 'US'),
        saveLocale: true,
        supportedLocales: const [Locale('en', 'US'), Locale('id', 'ID')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'US'),
        child: const MyApp(),
      ),
    ),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
