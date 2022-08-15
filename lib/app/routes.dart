import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lectro/screen/auth/complete_profile_screen.dart';
import 'package:lectro/screen/auth/new_password_screen.dart';
import 'package:lectro/screen/auth/register_screen.dart';
import 'package:lectro/screen/dashboard/monitor.dart';
import 'package:lectro/screen/profile/profil_screen.dart';

import '../screen/auth/login_screen.dart';

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
    '/profil',
    handler: Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          const ProfileScreen(),
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
