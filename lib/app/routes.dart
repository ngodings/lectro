import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lectro/screen/auth/complete_profile_screen.dart';
import 'package:lectro/screen/auth/new_password_screen.dart';
import 'package:lectro/screen/auth/register_screen.dart';
import 'package:lectro/screen/dashboard/monitor.dart';
import 'package:lectro/screen/profile/edit_profile.dart';
import 'package:lectro/screen/profile/profil_screen.dart';
import 'package:lectro/screen/settings/setting_screen.dart';

import '../screen/auth/login_screen.dart';
import '../screen/auth/register_code_screen.dart';
import '../screen/dashboard/details/detail_battery_screen.dart';
import '../screen/dashboard/details/detail_home_screen.dart';
import '../screen/scan/scan_screen.dart';

void configureRoutes() {
  final router = GetIt.I<FluroRouter>();

  router.notFoundHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const RoutesNotFound();
    },
  );

  router.define(
    '/login',
    handler: Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          const LoginScreen(),
    ),
    transitionType: TransitionType.none,
  );
  router.define(
    '/register',
    handler: Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          const RegisterScreen(),
    ),
    transitionType: TransitionType.none,
  );
  router.define(
    '/scan-barcode',
    handler: Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          const ScanBarcodeScreen(),
    ),
    transitionType: TransitionType.none,
  );
  router.define(
    '/register-code',
    handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      final args = context!.arguments as Map<String, dynamic>;
      return RegisterCodeScreen(
        username: args['username'],
        timestamp: args['timestamp'],
        email: args['email'],
        isEmail: args['isEmail'],
        newCode: args['newCode'],
      );
    }),
    transitionType: TransitionType.none,
  );
  router.define(
    '/complete-profile',
    handler: Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          const CompleteProfileScreen(),
    ),
    transitionType: TransitionType.none,
  );
  router.define(
    '/monitor',
    handler: Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          const MonitorScreen(),
    ),
    transitionType: TransitionType.none,
  );
  router.define(
    '/detail-home',
    handler: Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          const DetailHomeScreen(),
    ),
    transitionType: TransitionType.none,
  );
  router.define(
    '/detail-bms',
    handler: Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          const DetailBatteryScreen(),
    ),
    transitionType: TransitionType.none,
  );
  router.define(
    '/profil',
    handler: Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          const ProfileScreen(),
    ),
    transitionType: TransitionType.none,
  );
  router.define(
    '/edit-profile',
    handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      final args = context!.arguments as Map<String, dynamic>;
      return EditProfileScreen(
          fullName: args['fullName'],
          phone: args['phone'],
          address: args['address'],
          username: args['username'],
          aboutMe: args['aboutMe']);
    }),
    transitionType: TransitionType.none,
  );

  router.define(
    '/setting-screen',
    handler: Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          const SettingScreen(),
    ),
    transitionType: TransitionType.none,
  );

  router.define(
    '/forget-password',
    handler: Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          const NewPassword(),
    ),
    transitionType: TransitionType.none,
  );
}

class RoutesNotFound extends StatelessWidget {
  const RoutesNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text("I'm sorry, Routes not found"),
          ],
        ),
      ),
    );
  }
}
