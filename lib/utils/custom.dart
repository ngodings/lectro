import 'package:flutter/material.dart';
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
