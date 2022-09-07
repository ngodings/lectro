import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lectro/screen/dashboard/cubit/priority_cubit.dart';
import 'package:lectro/utils/theme_data.dart';

import '../../components/card/monitor_card.dart';
import '../cubit/non_priority_cubit.dart';

class DetailHomeScreen extends StatelessWidget {
  const DetailHomeScreen({Key? key}) : super(key: key);

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
      child: const DetailHome(),
    );
  }
}

class DetailHome extends HookWidget {
  const DetailHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pCubit = context.read<PriorityCubit>();
    final npCubit = context.read<NonPriorityCubit>();
    // ignore: unused_local_variable
    //Timer? timer;

    useEffect(() {
      Timer.periodic(
          const Duration(seconds: 2),
          (Timer t) => [
                pCubit.getLastRecordPriorityData(null),
                npCubit.getLastRecordNonPriority(null)
              ]);

      return;
    }, [
      pCubit,
      npCubit,
    ]);

    String energyPriority = '0.0';
    String powerPriority = '0.0';
    String energyNonPriority = '0.0';
    String powerNonPriority = '0.0';

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
              BlocConsumer<PriorityCubit, PriorityState>(
                listener: (context, state) {
                  if (state is PrioritySuccess) {
                    String energyPr = state.priority.energy!;
                    var energyPrio = double.parse(energyPr).toStringAsFixed(2);
                    energyPriority = energyPrio;

                    String powerPr = state.priority.powerActive!;
                    var powerPrio = double.parse(powerPr).toStringAsFixed(2);
                    powerPriority = powerPrio;
                  }
                },
                builder: (context, state) {
                  return Wrap(
                    spacing: 10.sp,
                    runSpacing: 2.sp,
                    children: [
                      MonitorCard(
                        title: 'Energy',
                        value: energyPriority,
                        txt: 'kWh',
                      ),
                      MonitorCard(
                        title: 'Power Usage',
                        value: powerPriority,
                        txt: 'watt',
                      ),
                    ],
                  );
                },
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
              BlocConsumer<NonPriorityCubit, NonPriorityState>(
                listener: (context, state) {
                  if (state is NonPrioritySuccess) {
                    String energyNonPr = state.nonPrio.energy!;
                    var energyNonPrior =
                        double.parse(energyNonPr).toStringAsFixed(2);
                    energyNonPriority = energyNonPrior;

                    String powerNonPr = state.nonPrio.powerActive!;
                    var powerNonPrior =
                        double.parse(powerNonPr).toStringAsFixed(2);
                    powerNonPriority = powerNonPrior;
                  }
                },
                builder: (context, state) {
                  return Wrap(
                    spacing: 10.sp,
                    runSpacing: 2.sp,
                    children: [
                      MonitorCard(
                        title: 'Energy',
                        value: energyNonPriority,
                        txt: 'kWh',
                      ),
                      MonitorCard(
                        title: 'Power Usage',
                        value: powerNonPriority,
                        txt: 'watt',
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
