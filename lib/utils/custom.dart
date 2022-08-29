import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:lectro/screen/components/loading/loading_dialog.dart';

class CustomDialog {
  static void showLoadingDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return const CustomLoadingDialogWidget();
        });
  }
}

class CustomAwesomeDialog {
  static void showWarningDailog(BuildContext context, String? title, desc) {
    AwesomeDialog(
            context: context,
            autoHide: const Duration(seconds: 3),
            dialogType: DialogType.WARNING,
            animType: AnimType.RIGHSLIDE,
            headerAnimationLoop: true,
            title: title,
            desc: desc,
            btnOkOnPress: () {},
            btnOkIcon: Icons.cancel,
            btnOkColor: Colors.yellow)
        .show();
  }

  static void showSuccessDialog(BuildContext context, String? title, desc) {
    AwesomeDialog(
            context: context,
            autoHide: const Duration(seconds: 3),
            dialogType: DialogType.SUCCES,
            animType: AnimType.RIGHSLIDE,
            headerAnimationLoop: true,
            title: title,
            desc: desc,
            btnOkOnPress: () {},
            btnOkIcon: Icons.check,
            btnOkColor: Colors.blue)
        .show();
  }

  static void showAskedDialog(
    BuildContext context,
    String title,
    desc,
    VoidCallback onYes,
  ) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.WARNING,
      headerAnimationLoop: false,
      animType: AnimType.TOPSLIDE,
      showCloseIcon: true,
      closeIcon: const Icon(Icons.close_fullscreen_outlined),
      title: title,
      desc: desc,
      btnCancelOnPress: () {},
      btnOkOnPress: onYes,
    ).show();
  }
}
