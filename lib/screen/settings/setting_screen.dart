import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lectro/screen/auth/cubit/profile_cubit.dart';
import 'package:lectro/utils/theme_data.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileCubit(),
        ),
      ],
      child: const _SettingScreen(),
    );
  }
}

class _SettingScreen extends StatelessWidget {
  const _SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gapAxis = 16.0.sp;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Setting',
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              color: CustomColor.onPrimary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding:
            EdgeInsets.only(top: 12.w, bottom: 12.w, left: 18.w, right: 18.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Dark Mode",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: CustomColor.onBackground,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Transform.scale(
                      scale: 0.8.sp,
                      child: CupertinoSwitch(
                        thumbColor: CustomColor.onPrimary,
                        activeColor: CustomColor.primary,
                        trackColor: Colors.grey,

                        value: true,
                        onChanged: (value) => {value: true},
                        // onChanged: (bool value) {
                        //   setState(() {
                        //     _switchValue = value;
                        //   });

                        //},
                      ),
                    )
                  ],
                ),
                Gap(8.sp),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Language",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: CustomColor.onBackground,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(gapAxis),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Check Network",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: CustomColor.onBackground,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(gapAxis),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Terms of Use",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: CustomColor.onBackground,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(gapAxis),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Privacy Policy",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: CustomColor.onBackground,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(gapAxis),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Send Feedback",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: CustomColor.onBackground,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(gapAxis),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Visit Our Instagram",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: CustomColor.onBackground,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(gapAxis),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Visit Our Website",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: CustomColor.onBackground,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(gapAxis),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Download usage statistics",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: CustomColor.onBackground,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Gap(240.sp),
            Padding(
              padding: EdgeInsets.only(bottom: 8.w, right: 10.w, left: 10.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Beta Version 1.0.0',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: CustomColor.primary,
                        fontSize: 12.w,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.headset_mic),
                        iconSize: 35.w,
                        color: CustomColor.primary,
                        splashColor: CustomColor.primary,
                        onPressed: () {},
                      ),
                      Text(
                        'Help',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: CustomColor.primary,
                            fontSize: 13.w,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
