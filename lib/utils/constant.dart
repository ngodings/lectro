// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

const ColorScheme colorScheme = const ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF008FD7),
  // ignore: deprecated_member_use
  primaryVariant: Color(0xFF0024D7),
  secondary: Color(0xFF001B29),
  // ignore: deprecated_member_use
  secondaryVariant: Color(0xFF8C8CA1),
  surface: Colors.white, //light
  background: Color(0xFFECF1F4),
  error: Color(0xFFD70000),
  onPrimary: Color(0xFFFAFAFA),
  onSecondary: Color(0xFFFAFAFA),
  onSurface: Color(0xFF000000),
  onBackground: Color(0xFF000000),
  onError: Color(0xFFFAFAFA),
);

//================Color=============================

const Color title = Color(0xFF424242);
const Color button = Color(0xFF3DC26A);
const kShadowColor = Color(0xFFE6E6E6);
const Color notUsed = Color(0xFF9A9A9A);
const Color home = Color(0xFFDF4747);
const Color grid = Color(0xFFD1D606);
const Color panel = Color(0xFF775FD1);
const Color powerwall = Color(0xFF31D3A1);
const Color costSaving = Color(0xff4af699);
const Color energy = Color(0xffaa4cfc);

//================Key=============================
const String clientToken = 'token';
const String clientTokenRefreshToken = 'refresh_token';
const String clientTokenUserId = 'id';
const String clientDeviceId = 'device_id';
const String lastEnergyPriority = 'last_energy_priority';
const String lastEnergyNonPriority = 'last_energy_non_priority';
const String lastEnergyGrid = 'last_grid';
const String lastEnergyBattery = 'last_battery';
const String clientTokenLearningToolCode = 'learning_tool_code';
const String clientGoogleKey = 'user_key';

//=================Error Messages==================
const String kErrorCantReachServer = "Can't reach to the http server";
const String kErrorException = "Terjadi kesalahan. Coba lagi";
const String kConnectionTimeout = "Connection Timeout";
const String kNoInternetConnection = "No Internet Connection";
const String kLoginUsernamePasswordWrongMessage =
    "Email atau password salah. Coba kembali";
