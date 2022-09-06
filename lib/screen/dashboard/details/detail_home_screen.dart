import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lectro/screen/dashboard/cubit/priority_cubit.dart';
import 'package:lectro/utils/theme_data.dart';

import '../../components/card/monitor_card.dart';

class DetailHomeScreen extends StatelessWidget {
  const DetailHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PriorityCubit(),
        ),
      ],
      child: const DetailHome(),
    );
  }
}

class DetailHome extends StatelessWidget {
  const DetailHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stats',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(top: 5.w, bottom: 14.w, left: 10.w, right: 10.w),
          child: Column(
            children: [
              Gap(4.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Priority",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: CustomColor.primary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              Gap(8.sp),
              Wrap(
                spacing: 10.sp,
                runSpacing: 2.sp,
                children: const [
                  MonitorCard(
                    title: 'Energy',
                    value: '155.02',
                    txt: 'kWh',
                  ),
                  MonitorCard(
                    title: 'Power Usage',
                    value: '155.02',
                    txt: 'watt',
                  ),
                ],
              ),
              Gap(16.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    " Non Priority ",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: CustomColor.primary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              Gap(8.sp),
              Wrap(
                spacing: 10.sp,
                runSpacing: 2.sp,
                children: const [
                  MonitorCard(
                    title: 'Energy',
                    value: '155.02',
                    txt: 'kWh',
                  ),
                  MonitorCard(
                    title: 'Power Usage',
                    value: '155.02',
                    txt: 'watt',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
