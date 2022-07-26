import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BasicButton extends StatelessWidget {
  BasicButton({Key? key, this.text, this.press, this.color}) : super(key: key);
  final String? text;
  final Function? press;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          backgroundColor: color,
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
