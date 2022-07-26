import 'package:flash/flash.dart' hide Toast;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:lectro/utils/extensions.dart';

import '../services/navigation.dart';

void showToastError(String message) {
  Fluttertoast.showToast(
    msg: message.capitalize,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 14.0,
  );
}

void showToastSuccess(String message) {
  Fluttertoast.showToast(
    msg: message.capitalize,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: const Color.fromARGB(255, 65, 138, 240),
    textColor: Colors.white,
    fontSize: 14.0,
  );
}

// void showTopFlash(String message) {
//   final context =
//       GetIt.I<NavigationServiceMain>().navigatorKey.currentState!.context;
//   context.showFlashBar(
//     content: Container(
//       height: 47,
//       child: Center(
//         child: Text(
//           message,
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//       ),
//     ),
//     duration: Duration(milliseconds: 1500),
//     position: FlashPosition.top,
//     backgroundColor: Theme.of(context).colorScheme.secondary,
//   );
// }

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
    backgroundColor: Theme.of(context).colorScheme.error,
  );
}
