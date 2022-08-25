import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

class LongButton extends StatelessWidget {
  const LongButton(
      {Key? key,
      required this.colorBox,
      required this.color,
      required this.txtButton,
      this.onTap})
      : super(key: key);
  final Color colorBox, color;
  final String txtButton;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 36.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.w), color: colorBox),
        child: Center(
          child: Text(
            txtButton,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12.sp,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
