import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lectro/utils/theme_data.dart';
import 'package:velocity_x/velocity_x.dart';

class RadioButtonWidget extends StatelessWidget {
  const RadioButtonWidget({Key? key, required this.active, required this.text})
      : super(key: key);
  final bool active;
  final String text;

  @override
  Widget build(BuildContext context) {
    if (active == true) {
      return HStack([
        Text(
          text,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: CustomColor.onBackground,
              fontSize: 12.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Gap(20.sp),
        Icon(
          Icons.circle,
          size: 10,
          color: CustomColor.primary,
        ),
      ]);
    } else {
      return HStack([
        Text(
          text,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: CustomColor.onBackground,
              fontSize: 12.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Gap(20.sp),
        const Icon(
          Icons.circle,
          size: 10,
          color: Colors.grey,
        ),
      ]);
    }
  }
}
