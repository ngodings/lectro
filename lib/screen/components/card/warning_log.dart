import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lectro/utils/custom.dart';

import '../../../utils/theme_data.dart';

class LogWidget extends StatelessWidget {
  const LogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.sp),
      child: Column(
        children: <Widget>[
          Text(
            'There is a problem with the device!',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: CustomColor.onBackground,
                fontSize: 12.w,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Gap(18.sp),
          Container(
            height: 24.sp,
            width: 134.sp,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.sp),
                color: const Color(0xFFD97979)),
            child: Center(
              child: Text(
                '<deviceid><error code><date>.csv',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 6.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Gap(10.sp),
          Text(
            'Unduh Log',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                decoration: TextDecoration.underline,
                color: CustomColor.onBackground,
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Gap(10.sp),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 24.sp,
                width: 98.sp,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.sp),
                    color: const Color(0xFF9D5E5E)),
                child: Center(
                  child: Text(
                    'Kembali',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 6.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              Gap(30.sp),
              InkWell(
                onTap: () {
                  CustomAwesomeDialog.showSuccessDialog(
                      context,
                      'Successfully submitted a report!',
                      'We will immediately confirm your report.');
                },
                child: Container(
                  height: 24.sp,
                  width: 98.sp,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.sp),
                      color: const Color(0xFF9D5E5E)),
                  child: Center(
                    child: Text(
                      'Laporkan',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 6.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
