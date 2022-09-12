import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lectro/screen/auth/cubit/profile_cubit.dart';
import 'package:lectro/screen/components/button/switch_custom.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Setting',
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              color: CustomColor.onBackground,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding:
            EdgeInsets.only(top: 14.w, bottom: 14.w, left: 10.w, right: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Gap(4.sp),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dark Mode",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: CustomColor.primary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SwitchCustomButton(
                  value: false,
                  x: 0.0,
                  y: 0.0,
                  scale: 0.0,
                  action: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
