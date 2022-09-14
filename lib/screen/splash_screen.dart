import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lectro/repositories/main_repository.dart';
import 'package:lectro/utils/constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => const Splash(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      right: 50.w, left: 50.w, top: 220.w, bottom: 230.w),
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/icons/matador.png',
                          //height: 200.w,
                        ),
                        Image.asset(
                          'assets/icons/lectro.png',
                          //height: 100.w,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Image.asset('assets/icons/slogan.png', height: 100.w)
          ],
        ),
      ),
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => MainRepository(),
      lazy: false,
      child: const _SplashBody(),
    );
  }
}

class _SplashBody extends StatefulWidget {
  const _SplashBody({Key? key}) : super(key: key);

  @override
  State<_SplashBody> createState() => __SplashBodyState();
}

class __SplashBodyState extends State<_SplashBody>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      right: 50.w, left: 50.w, top: 220.w, bottom: 230.w),
                  child: Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/icons/matador.png',
                          //height: 200.w,
                        ),
                        Image.asset(
                          'assets/icons/lectro.png',
                          //height: 100.w,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Image.asset('assets/icons/slogan.png', height: 100.w)
          ],
        ),
      ),
    );
  }
}
