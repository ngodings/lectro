import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lectro/screen/components/loading/loading_widget.dart';
import 'package:lectro/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:lectro/utils/custom.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:gap/gap.dart';

import '../../../services/navigation.dart';
import '../../../utils/theme_data.dart';
import '../cubit/non_priority_cubit.dart';
import '../cubit/priority_cubit.dart';

class MainLoadDialog extends StatelessWidget {
  const MainLoadDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PriorityCubit(),
        ),
        BlocProvider(
          create: (context) => NonPriorityCubit(),
        ),
      ],
      child: const _MainLoadDialog(),
    );
  }
}

class _MainLoadDialog extends HookWidget {
  const _MainLoadDialog({Key? key}) : super(key: key);

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
    int controlRelay = 0;

    final pCubit = context.read<PriorityCubit>();
    final npCubit = context.read<NonPriorityCubit>();

    useEffect(() {
      Timer.periodic(
          const Duration(seconds: 1),
          (Timer t) => [
                pCubit.getViewSettingPriority(null),
                npCubit.getViewSettingNonPriority(null),
              ]);

      return;
    }, [
      pCubit,
      npCubit,
    ]);
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                top: 0, bottom: 14.sp, left: 10.sp, right: 10.sp),
            margin: EdgeInsets.only(top: 16.sp),
            decoration: BoxDecoration(
                color: home,
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
                      top: 10.sp, bottom: 10.sp, left: 5.sp, right: 5.sp),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Power Load Management',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16.w,
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
                    Icon(
                      Icons.home,
                      color: Colors.white.withOpacity(0.8),
                      size: 75.w,
                    ),
                    Gap(10.sp),
                    HStack([
                      VStack([
                        Text(
                          'Priority',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14.w,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Gap(16.sp),
                        Text(
                          'Non Priority',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14.w,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ]),
                      Gap(15.sp),
                      VStack([
                        Text(
                          ':',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14.w,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Gap(16.sp),
                        Text(
                          ':',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14.w,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ]),
                      VStack([
                        Transform.scale(
                          scale: 0.5.sp,
                          child: BlocConsumer<PriorityCubit, PriorityState>(
                            listener: (context, state) {
                              if (state is SettingPrioritySuccess) {
                                controlRelay = state.priority.controlRelay!;
                              }
                              if (state is PriorityFailed) {
                                const CustomLoadingWidget();
                              }
                            },
                            builder: (context, state) {
                              if (controlRelay == 1) {
                                return CupertinoSwitch(
                                  thumbColor: CustomColor.tertiary,
                                  activeColor: Colors.white,
                                  trackColor: Colors.grey,
                                  value: true,
                                  onChanged: (value) => {
                                    CustomAwesomeDialog.showAskedDialog(
                                        context,
                                        'Warning!',
                                        'Are you sure want to turn on/off ?',
                                        () {
                                      useEffect(() {
                                        pCubit.updateSettingPriority('0');
                                        value = false;
                                        return;
                                      });
                                    }),
                                    useEffect(() {
                                      value = false;
                                      return;
                                    }),
                                  },
                                );
                              } else {
                                return CupertinoSwitch(
                                  thumbColor: CustomColor.tertiary,
                                  activeColor: Colors.white,
                                  trackColor: Colors.grey,
                                  value: false,
                                  onChanged: (value) => {
                                    CustomAwesomeDialog.showAskedDialog(
                                        context,
                                        'Warning!',
                                        'Are you sure want to turn on/off ?',
                                        () {
                                      useEffect(() {
                                        pCubit.updateSettingPriority('1');
                                        value = true;
                                        return;
                                      });
                                    }),
                                    useEffect(() {
                                      value = true;
                                      return;
                                    }),
                                  },
                                );
                              }
                            },
                          ),
                        ),
                        // Gap(4.sp),
                        Transform.scale(
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
                      top: 10.sp, bottom: 10.sp, left: 5.sp, right: 5.sp),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          GetIt.I<NavigationServiceMain>()
                              .pushNamed('/detail-home');
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
