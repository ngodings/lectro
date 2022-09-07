import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lectro/utils/theme_data.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../services/navigation.dart';

class BatteryLoadDialog extends StatelessWidget {
  const BatteryLoadDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContext(context),
    );
  }

  dialogContext(BuildContext context) {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                top: 0, bottom: 14.sp, left: 10.sp, right: 10.sp),
            margin: EdgeInsets.only(top: 16.sp),
            decoration: BoxDecoration(
                color: CustomColor.primary,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12.sp),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 10.0))
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 10.sp, bottom: 5.sp, left: 5.sp, right: 5.sp),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Battery Management System',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: CustomColor.onPrimary,
                            fontSize: 14.w,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          GetIt.I<NavigationServiceMain>().pop();
                        },
                        child: Icon(
                          Icons.close_rounded,
                          color: Colors.white,
                          size: 14.w,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/icons/ess-lectro.png',
                      height: 100.w,
                    ),
                    Gap(10.sp),
                    HStack([
                      VStack([
                        Text(
                          'Capacity',
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
                          'Status',
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
                          'State of Charge',
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
                          'Temperature',
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
                          'Turn on/off',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 12.w,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ]),
                      Gap(10.sp),
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
                        Gap(18.sp),
                        Text(
                          '1000 wH',
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
                          'Good',
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
                          '100%',
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
                          '34 °C',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 12.w,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Transform.scale(
                          origin: Offset(-30.0.sp, -12.0.sp),
                          scale: 0.5.sp,
                          child: CupertinoSwitch(
                            thumbColor: CustomColor.tertiary,
                            activeColor: Colors.white,
                            trackColor: Colors.grey,

                            value: true,
                            onChanged: (value) => {value: false},
                            // onChanged: (bool value) {
                            //   setState(() {
                            //     _switchValue = value;
                            //   });

                            //},
                          ),
                        ),
                      ])
                    ]),
                  ],
                ),
                Gap(5.sp),
                Padding(
                  padding: EdgeInsets.only(
                      top: 10.sp, bottom: 0.sp, left: 5.sp, right: 5.sp),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          GetIt.I<NavigationServiceMain>()
                              .pushNamed('/detail-bms');
                        },
                        child: Text(
                          'Details',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
