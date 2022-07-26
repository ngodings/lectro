import 'package:flash/flash.dart' hide Toast;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:lectro/utils/extensions.dart';
import 'package:lectro/utils/theme_data.dart';

import '../services/navigation.dart';

void showToastError(String message) {
  Fluttertoast.showToast(
    msg: message.capitalize,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: CustomColor.error,
    textColor: CustomColor.onError,
    fontSize: 14.0,
  );
}

void showToastWarning(String message) {
  Fluttertoast.showToast(
    msg: message.capitalize,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.yellow,
    textColor: Colors.black,
    fontSize: 14.0,
  );
}

void showToastSuccess(String message) {
  Fluttertoast.showToast(
    msg: message.capitalize,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: CustomColor.primary,
    textColor: CustomColor.onPrimary,
    fontSize: 14.0,
  );
}

void showTopFlash(String message) {
  final context =
      GetIt.I<NavigationServiceMain>().navigatorKey.currentState!.context;
  context.showFlashBar(
    content: SizedBox(
      height: 47,
      child: Center(
        child: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ),
    duration: const Duration(milliseconds: 1500),
    position: FlashPosition.top,
    backgroundColor: Theme.of(context).colorScheme.secondary,
  );
}

void showTopError(String message) {
  final context =
      GetIt.I<NavigationServiceMain>().navigatorKey.currentState!.context;
  context.showFlashBar(
    content: Center(
      child: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
    ),
    duration: const Duration(milliseconds: 1500),
    position: FlashPosition.top,
    backgroundColor: CustomColor.error,
  );
}
