import 'package:easy_localization/easy_localization.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:lectro/app/routes.dart';
import 'package:lectro/screen/splash_screen.dart';
import 'package:lectro/utils/theme_data.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import '../services/dio_service.dart';
import '../services/navigation.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final ColorScheme _colorScheme = const ColorScheme(
  //   brightness: Brightness.light,
  //   primary: Color(0xFF008FD7),
  //   primaryVariant: Color(0xFF0024D7),
  //   secondary: Color(0xFF001B29),
  //   secondaryVariant: Color(0xFF8C8CA1),
  //   surface: Colors.white, //light
  //   background: Color(0xFFECF1F4),
  //   error: Color(0xFFD70000),
  //   onPrimary: Color(0xFFFAFAFA),
  //   onSecondary: Color(0xFFFAFAFA),
  //   onSurface: Color(0xFF000000),
  //   onBackground: Color(0xFF000000),
  //   onError: Color(0xFFFAFAFA),
  // );

  @override
  void initState() {
    super.initState();
    DIService.initialize();
    configureRoutes();
  }

  @override
  Widget build(BuildContext context) {
    final serviceLocator = GetIt.instance;
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: (context, widget) => MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        navigatorObservers: [
          SentryNavigatorObserver(),
        ],
        locale: context.locale,
        navigatorKey: serviceLocator<NavigationServiceMain>().navigatorKey,
        onGenerateRoute: serviceLocator<FluroRouter>().generator,
        theme: ThemeData(
          colorScheme: lightTheme,
          primaryColor: lightTheme.primary,
          secondaryHeaderColor: lightTheme.secondary,
          backgroundColor: lightTheme.background,
          scaffoldBackgroundColor: lightTheme.background,
          brightness: lightTheme.brightness,
          buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          fontFamily: 'Nunito',
        ),
        darkTheme: ThemeData(
          colorScheme: darkTheme,
          primaryColor: darkTheme.primary,
          secondaryHeaderColor: darkTheme.secondary,
          backgroundColor: darkTheme.background,
          scaffoldBackgroundColor: darkTheme.background,
          brightness: darkTheme.brightness,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
