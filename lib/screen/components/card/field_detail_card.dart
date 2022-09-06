import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class FiedlDetailCard extends StatelessWidget {
  const FiedlDetailCard(
      {Key? key,
      required this.field1,
      required this.field2,
      required this.field3,
      required this.field4,
      required this.field5,
      required this.value1,
      required this.value2,
      required this.value3,
      required this.value4,
      required this.value5,
      required this.image})
      : super(key: key);
  final String field1, field2, field3, field4, field5;
  final String value1, value2, value3, value4, value5;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(image),
          Gap(10.sp),
          HStack([
            VStack([
              Text(
                field1,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 12.w,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                field2,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 12.w,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Gap(4.sp),
              Text(
                field3,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 12.w,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Gap(4.sp),
              Text(
                field4,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 12.w,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Gap(4.sp),
              Text(
                field5,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 12.w,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ]),
            Gap(4.sp),
            VStack([
              Text(
                ':',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 12.w,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Gap(4.sp),
              Text(
                ':',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 12.w,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Gap(4.sp),
              Text(
                ':',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 12.w,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Gap(4.sp),
              Text(
                ':',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 12.w,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Gap(4.sp),
              Text(
                ':',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 12.w,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ]),
            Gap(4.sp),
            VStack([
              Text(
                value1,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 12.w,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Gap(4.sp),
              Text(
                value2,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 12.w,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Gap(4.sp),
              Text(
                value3,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 12.w,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Gap(4.sp),
              Text(
                value4,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 12.w,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Gap(4.sp),
              Text(
                value5,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 12.w,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ])
          ]),
        ],
      ),
    );
  }
}
