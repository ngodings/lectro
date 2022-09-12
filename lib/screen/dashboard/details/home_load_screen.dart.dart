import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lectro/screen/components/button/switch_custom.dart';
import 'package:lectro/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:gap/gap.dart';

import '../../../services/navigation.dart';
import '../../../utils/alert_toast.dart';
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
    bool valueP = false;
    bool valueNP = false;

    final pCubit = context.read<PriorityCubit>();
    final npCubit = context.read<NonPriorityCubit>();

    _checkValuePriority() async {
      valueP = await pCubit.getValueSettingPriority();
      print('ini P');
      print(valueP);
    }

    _checkValueNonPriority() async {
      valueNP = await npCubit.getValueSettingNonPriority();
    }

    useEffect(() {
      Timer.periodic(
          const Duration(seconds: 1),
          (Timer t) => [
                _checkValueNonPriority(),
                _checkValuePriority(),
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
                        BlocConsumer<PriorityCubit, PriorityState>(
                          listener: (context, state) {
                            if (state is SettingPrioritySuccess) {
                              controlRelay = state.priority.controlRelay!;
                            }
                            if (state is PrioritySuccessMessage) {
                              showToastSuccess('Success.');
                              Navigator.of(context).pop();
                            }
                            if (state is PriorityFailed) {
                              showToastError('Please Try again.');
                            }
                          },
                          builder: (context, state) {
                            if (valueP == false) {
                              return SwitchCustomButton(
                                value: valueP,
                                scale: 0.5.sp,
                                x: 0.0,
                                y: 0.0,
                                action: () {
                                  pCubit.updateSettingPriority('1');
                                  showToastSuccess('Success.');
                                  Navigator.of(context).pop();
                                  useEffect(() {
                                    valueP = true;
                                    return;
                                  });
                                },
                              );
                            } else {
                              return SwitchCustomButton(
                                value: valueP,
                                scale: 0.5.sp,
                                x: 0.0,
                                y: 0.0,
                                action: () {
                                  pCubit.updateSettingPriority('0');
                                  showToastSuccess('Success.');
                                  Navigator.of(context).pop();
                                  useEffect(() {
                                    valueP = false;
                                    return;
                                  });
                                },
                              );
                            }
                          },
                        ),
                        // Gap(4.sp),
                        BlocConsumer<NonPriorityCubit, NonPriorityState>(
                          listener: (context, state) {
                            if (state is NonPrioSuccessMsg) {
                              showToastSuccess('Success.');
                              Navigator.of(context).pop();
                            }
                            if (state is NonPriorityFailed) {
                              showToastError('Please Try again.');
                            }
                          },
                          builder: (context, state) {
                            if (valueNP == false) {
                              return SwitchCustomButton(
                                value: valueNP,
                                scale: 0.5.sp,
                                x: 0.0,
                                y: 0.0,
                                action: () {
                                  npCubit.updateSettingNonPriority('1');
                                  showToastSuccess('Success.');
                                  Navigator.of(context).pop();
                                  useEffect(() {
                                    valueNP = true;
                                    return;
                                  });
                                },
                              );
                            } else {
                              return SwitchCustomButton(
                                value: valueNP,
                                scale: 0.5.sp,
                                x: 0.0,
                                y: 0.0,
                                action: () {
                                  npCubit.updateSettingNonPriority('0');
                                  showToastSuccess('Success.');
                                  Navigator.of(context).pop();
                                  useEffect(() {
                                    valueNP = false;
                                    return;
                                  });
                                },
                              );
                            }
                          },
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
