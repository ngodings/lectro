import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/icons/matador.png',
        ),
        SizedBox(
          height: 10.h,
        ),
        Image.asset(
          'assets/icons/lectro.png',
          height: 40.h,
        ),
      ],
    );
  }
}
