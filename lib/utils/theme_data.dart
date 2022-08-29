import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:lectro/services/navigation.dart';

final ColorScheme lightTheme = ColorScheme.fromSeed(
  seedColor: const Color(0xFF006B53),
  brightness: Brightness.light,
  primary: const Color(0xFF006B53),
  primaryContainer: const Color(0xFF77F9D2),
  onPrimaryContainer: const Color(0xFF012018),
  onPrimary: const Color(0xFFFFFFFF),
  secondary: const Color(0xFF4B635A),
  secondaryContainer: const Color(0xFFCEE9DD),
  onSecondaryContainer: const Color(0xFF072019),
  onSecondary: const Color(0xFFFFFFFF),
  tertiary: const Color(0xFF416376),
  onTertiary: const Color(0xFFFFFFFF),
  tertiaryContainer: const Color(0xFFC4E8FF),
  onTertiaryContainer: const Color(0xFF001E2C),
  onSurface: const Color(0xFF191C1B),
  surface: const Color(0xFFFBFDFA),
  background: const Color(0xFFFBFDFA),
  onBackground: const Color(0xFF191C1B),
  error: const Color(0xFFBA1B1B),
  onErrorContainer: const Color(0xFF410001),
  onError: const Color(0xFFFFFFFF),
  errorContainer: const Color(0xFFFFDAD4),
  surfaceVariant: const Color(0xFFDBE5DF),
  onSurfaceVariant: const Color(0xFF3F4945),
  outline: const Color(0xFF6F7974),
);

final ColorScheme darkTheme = ColorScheme.fromSeed(
  seedColor: const Color(0xFF58DCB7),
  brightness: Brightness.dark,
  primary: const Color(0xFF58DCB7),
  primaryContainer: const Color(0xFF00513E),
  onPrimaryContainer: const Color(0xFF77F9D2),
  onPrimary: const Color(0xFF00382A),
  secondary: const Color(0xFFB2CCC1),
  secondaryContainer: const Color(0xFF344B43),
  onSecondaryContainer: const Color(0xFFCEE9DD),
  onSecondary: const Color(0xFF1D352D),
  tertiary: const Color(0xFFA8CCE2),
  onTertiary: const Color(0xFF0D3446),
  tertiaryContainer: const Color(0xFF284B5E),
  onTertiaryContainer: const Color(0xFFC4E8FF),
  onSurface: const Color(0xFFE1E3E0),
  surface: const Color(0xFF191C1B),
  background: const Color(0xFF191C1B),
  onBackground: const Color(0xFFE1E3E0),
  error: const Color(0xFFFFB4A9),
  onErrorContainer: const Color(0xFFFFDAD4),
  onError: const Color(0xFF680003),
  errorContainer: const Color(0xFF930006),
  surfaceVariant: const Color(0xFF3F4945),
  onSurfaceVariant: const Color(0xFFBFC9C3),
  outline: const Color(0xFF89938E),
);

final service = GetIt.I<NavigationServiceMain>();

final themes = Theme.of(service.navigatorKey.currentState!.context);

class CustomColor {
  static Color primary =
      Theme.of(service.navigatorKey.currentState!.context).colorScheme.primary;
  static Color onPrimary = Theme.of(service.navigatorKey.currentState!.context)
      .colorScheme
      .onPrimary;
  static Color primaryContainer = themes.colorScheme.primaryContainer;
  static Color onPrimaryContainer = themes.colorScheme.onPrimaryContainer;

  static Color background = themes.colorScheme.background;
  static Color onBackground = themes.colorScheme.onBackground;

  static Color secondary = themes.colorScheme.secondary;
  static Color onSecondary = themes.colorScheme.onSecondary;
  static Color secondaryContainer = themes.colorScheme.secondaryContainer;
  static Color onSecondaryContainer = themes.colorScheme.onSecondaryContainer;

  static Color tertiary = themes.colorScheme.tertiary;
  static Color onTertiary = themes.colorScheme.onTertiary;
  static Color tertiaryContainer = themes.colorScheme.tertiaryContainer;
  static Color onTertiaryContainer = themes.colorScheme.onTertiaryContainer;

  static Color error = themes.colorScheme.error;
  static Color errorContainer = themes.colorScheme.errorContainer;
  static Color onErrorContainer = themes.colorScheme.onErrorContainer;
  static Color onError = themes.colorScheme.onError;

  static Color surface = themes.colorScheme.surface;
  static Color onSurface = themes.colorScheme.onSurface;
  static Color surfaceVariant = themes.colorScheme.onSurfaceVariant;
  static Color onSurfaceVariant = themes.colorScheme.onSurfaceVariant;

  static Color outline = themes.colorScheme.outline;

  static Color inverseOnSurface = themes.colorScheme.onInverseSurface;
  static Color inverseSurface = themes.colorScheme.inverseSurface;
  static Color inversePrimary = themes.colorScheme.inversePrimary;

  static Color surface1 = primary.withOpacity(0.05);
  static Color surface2 = primary.withOpacity(0.08);
  static Color surface3 = primary.withOpacity(0.11);
  static Color surface4 = primary.withOpacity(0.12);
  static Color surface5 = primary.withOpacity(0.14);

  static Color shimmerBase = const Color(0xFFEEEEEE);
  static Color shimmerLight = const Color(0xFFEEEEEE).withOpacity(0.05);
}

enum AppTheme {
  lightAppTheme,
  darkAppTheme,
}

final appThemeData = {
  AppTheme.darkAppTheme: ThemeData(
    scaffoldBackgroundColor: darkTheme.background,
    colorScheme: darkTheme,
    textTheme: TextTheme(
      headline1: const TextStyle().copyWith(
        color: darkTheme.onPrimary,
        fontSize: 26.w,
        fontWeight: FontWeight.w800,
      ),
      headline2: const TextStyle().copyWith(
        color: darkTheme.onPrimary,
        fontSize: 22.w,
        fontWeight: FontWeight.w700,
      ),
      headline3: const TextStyle().copyWith(
        color: darkTheme.onPrimary,
        fontSize: 20.w,
        fontWeight: FontWeight.w600,
      ),
      headline4: const TextStyle().copyWith(
        color: darkTheme.onPrimary,
        fontSize: 18.w,
        fontWeight: FontWeight.w500,
      ),
      headline5: const TextStyle().copyWith(
        color: darkTheme.onPrimary,
        fontSize: 16.w,
        fontWeight: FontWeight.w500,
      ),
      headline6: const TextStyle().copyWith(
        color: darkTheme.onPrimary,
        fontSize: 14.w,
        fontWeight: FontWeight.w500,
      ),
    ),
  )
};
