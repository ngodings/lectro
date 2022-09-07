import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lectro/screen/components/card/field_detail_card.dart';
import 'package:lectro/screen/dashboard/cubit/priority_cubit.dart';
import '../../../utils/theme_data.dart';
import '../../components/card/monitor_card.dart';

class DetailBatteryScreen extends StatelessWidget {
  const DetailBatteryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => PriorityCubit(),
      ),
    ], child: const DetailBattery());
  }
}

class DetailBattery extends StatelessWidget {
  const DetailBattery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Monitoring Battery',
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
        padding:
            EdgeInsets.only(top: 14.w, bottom: 14.w, left: 10.w, right: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Gap(4.sp),
            Text(
              "Battery Pack",
              textAlign: TextAlign.left,
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: CustomColor.primary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Gap(14.sp),
            Container(
              decoration: BoxDecoration(
                color: CustomColor.primary,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12.sp),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 10.0))
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: 10.sp, left: 15.sp, right: 15.sp),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ESS 1 Plus Battery Pack',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Gap(80.w),
                        Transform.scale(
                          origin: Offset(0.0.sp, -20.0.sp),
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
                      ],
                    ),
                  ),
                  const FiedlDetailCard(
                    field1: 'Device ID',
                    field2: 'Color',
                    field3: 'App Support',
                    field4: 'Connected Account',
                    field5: 'Warranty',
                    value1: 'IDNXXX',
                    value2: 'Matte White',
                    value3: 'Yes',
                    value4: '2',
                    value5: '6 Years',
                    image: 'assets/icons/ess-lectro-1.png',
                  ),
                  Gap(16.h)
                ],
              ),
            ),
            //
            Gap(18.sp),
            Text(
              "Battery Management System",
              textAlign: TextAlign.left,
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: CustomColor.primary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Gap(14.sp),
            Container(
              decoration: BoxDecoration(
                color: CustomColor.primary,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12.sp),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 10.0))
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: 10.sp, left: 15.sp, right: 15.sp),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'BMS 03',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Gap(80.w),
                        Transform.scale(
                          origin: Offset(0.0.sp, -20.0.sp),
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
                      ],
                    ),
                  ),
                  const FiedlDetailCard(
                    field1: 'Device ID',
                    field2: 'Series',
                    field3: 'Max Current',
                    field4: 'Voltage Rate',
                    field5: 'Battery Type Coverage',
                    value1: 'IDNXXX',
                    value2: '15 Series',
                    value3: '100 Ampere',
                    value4: '48 Volt',
                    value5: 'LiFePO4',
                    image: 'assets/icons/bms-icon.png',
                  ),
                  Gap(16.h)
                ],
              ),
            ),
            Gap(18.sp),
            Text(
              "Stats",
              textAlign: TextAlign.left,
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: CustomColor.primary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Gap(14.sp),
            Wrap(
              spacing: 10.sp,
              runSpacing: 5.sp,
              children: const [
                MonitorCard(
                  title: 'Status',
                  value: 'Good',
                  txt: '',
                ),
                MonitorCard(
                  title: 'Temperature',
                  value: '44',
                  txt: 'Celcius (°C)',
                ),
                MonitorCard(
                  title: 'State of Health (SOH)',
                  value: '94',
                  txt: '%',
                ),
                MonitorCard(
                  title: 'State of Charge (SOC)',
                  value: '44',
                  txt: 'Celcius (°C)',
                ),
                MonitorCard(
                  title: 'Energy',
                  value: '1100',
                  txt: 'wH',
                ),
                MonitorCard(
                  title: 'Current',
                  value: '44',
                  txt: 'mA',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
