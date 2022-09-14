library config.globals;

import 'package:flutter/material.dart';
import 'package:lectro/helper/theme_mode.dart';
import 'package:lectro/utils/theme_data.dart';

AppTheme currentTheme = AppTheme();

ThemeData lightThemes = ThemeData(
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
);

ThemeData darkThemes = ThemeData(
  colorScheme: darkTheme,
  primaryColor: darkTheme.primary,
  secondaryHeaderColor: darkTheme.secondary,
  backgroundColor: darkTheme.background,
  scaffoldBackgroundColor: darkTheme.background,
  brightness: darkTheme.brightness,
);
