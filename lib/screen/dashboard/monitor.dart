import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lectro/screen/components/card/warning_log.dart';
import 'package:lectro/screen/dashboard/change_device.dart';
import 'package:lectro/screen/dashboard/cubit/battery_cubit.dart';
import 'package:lectro/screen/dashboard/cubit/device_cubit.dart';
import 'package:lectro/screen/dashboard/cubit/price_packet_cubit.dart';
import 'package:lectro/utils/custom.dart';
import 'package:lectro/utils/extensions.dart';
import 'package:lectro/utils/theme_data.dart';

import '../../services/navigation.dart';
import '../../utils/constant.dart';
import '../auth/cubit/profile_cubit.dart';
import '../components/card/circle_card.dart';
import '../components/card/monitor_card.dart';
import '../components/title/main_title.dart';
import 'cubit/grid_cubit.dart';
import 'cubit/non_priority_cubit.dart';
import 'cubit/priority_cubit.dart';
import 'details/battery_load_screen.dart';
import 'details/home_load_screen.dart.dart';
import 'grafik_tab.dart';

class MonitorScreen extends HookWidget {
  const MonitorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PriorityCubit(),
        ),
        BlocProvider(
          create: (context) => GridCubit(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(),
        ),
        BlocProvider(
          create: (context) => NonPriorityCubit(),
        ),
        BlocProvider(
          create: (context) => BatteryCubit(),
        ),
        BlocProvider(
          create: (context) => DeviceCubit(),
        ),
        BlocProvider(
          create: (context) => PricePacketCubit(),
        )
      ],
      child: const Monitor(),
    );
  }
}

// class CheckDevice extends HookWidget {
//   const CheckDevice({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // ignore: unused_local_variable
//     final prCubit = context.read<ProfileCubit>();
//     useEffect(() {
//       prCubit.getDetailProfile();
//       return;
//     });

//     return BlocBuilder<ProfileCubit, ProfileState>(
//       builder: (context, state) {
//         if (state is AccessGivenProfilSuccess) {
//           final totalRoutes = state.user.totalRoutes ?? 1;

//           if (totalRoutes != 0) {
//             return const Monitor();
//           } else {
//             return const ScanBarcodeScreen();
//             // GetIt.I<NavigationServiceMain>().pushNamed('/scan-barcode');
//           }
//         } else {
//           return const CustomLoadingWidget();
//         }
//       },
//     );
//   }
// }

class Monitor extends HookWidget {
  const Monitor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _pCubit = context.read<PriorityCubit>();
    // ignore: no_leading_underscores_for_local_identifiers
    final _gCubit = context.read<GridCubit>();
    // ignore: no_leading_underscores_for_local_identifiers
    final _prCubit = context.read<ProfileCubit>();
    // ignore: no_leading_underscores_for_local_identifiers
    final _bCubit = context.read<BatteryCubit>();
    // ignore: no_leading_underscores_for_local_identifiers
    final _npCubit = context.read<NonPriorityCubit>();
    // ignore: no_leading_underscores_for_local_identifiers
    final _dCubit = context.read<DeviceCubit>();
    // ignore: no_leading_underscores_for_local_identifiers
    final _ppCubit = context.read<PricePacketCubit>();

    // ignore: unused_local_variable
    Timer? timer;

    String energyPriority = '0.0';
    String energyNonPriority = '0.0';
    String energyGrid = '0.0';
    String energyBattery = '0.0';

    useEffect(() {
      _prCubit.getUserDeviceID();

      Timer.periodic(
          const Duration(seconds: 2),
          (Timer t) => [
                _bCubit.getLastRecordBatteryData(null),
                _gCubit.getLastRecordGridData(null),
                _pCubit.getLastRecordPriorityData(null),
                _npCubit.getLastRecordNonPriority(null),
                _prCubit.getProfile(null),
                _dCubit.getDeviceStatus(null),
                _ppCubit.getkWhPacket(null),
              ]);

      return;
    }, [
      _pCubit,
      _prCubit,
      _gCubit,
      _npCubit,
      _dCubit,
      _bCubit,
      _ppCubit,
    ]);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 65.w,
              ),
              Center(
                child: MainTitle(
                  title: 'LECTRO - ENERGY SMART SYSTEM',
                  color: CustomColor.onBackground,
                ),
              ),
              SizedBox(
                height: 30.w,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocConsumer<PriorityCubit, PriorityState>(
                    listener: (context, state) {
                      if (state is PrioritySuccess) {
                        String energyPr = state.priority.energy!;
                        var energyPrio =
                            double.parse(energyPr).toStringAsFixed(2);
                        energyPriority = energyPrio;
                      }
                    },
                    builder: (context, state) {
                      double doubleEP = double.parse(energyPriority);
                      double doubleENP = double.parse(energyNonPriority);
                      double doubleEG = double.parse(energyGrid);
                      double mainLoad = doubleEP + doubleENP;
                      double panelSurya = doubleEG - (doubleEP + doubleENP);
                      if (panelSurya > 0 && mainLoad > 0) {
                        return CircleMonitorUp(
                          circleColor: panel,
                          numberColor: Colors.white,
                          img: 'assets/icons/solar-panel-no-text.png',
                          txt: '$panelSurya kWh',
                        );
                      } else if (panelSurya < 0 && mainLoad > 0) {
                        return const CircleMonitorUp(
                          circleColor: panel,
                          numberColor: Colors.white,
                          img: 'assets/icons/solar-panel-no-text.png',
                          txt: 'is used',
                        );
                      } else {
                        return const CircleMonitorUp(
                          circleColor: Colors.grey,
                          numberColor: Colors.white,
                          img: 'assets/icons/solar-panel-no-text.png',
                          txt: '0.0 kWh',
                        );
                      }
                    },
                  ),
                  SizedBox(width: 110.w),
                  BlocConsumer<GridCubit, GridState>(
                    listener: (context, state) {
                      if (state is GridSuccess) {
                        String energyGr = state.grid.energy!;
                        var energyG = double.parse(energyGr).toStringAsFixed(1);
                        energyGrid = energyG;
                      }
                    },
                    builder: (context, state) {
                      if (energyGrid == '0.0') {
                        return const CircleMonitorUp(
                          circleColor: Colors.grey,
                          numberColor: Colors.white,
                          img: 'assets/icons/flash.png',
                          txt: '0.0 kWh',
                        );
                      } else {
                        return CircleMonitorUp(
                          circleColor: grid,
                          numberColor: Colors.white,
                          img: 'assets/icons/flash.png',
                          txt: '$energyGrid kWh',
                        );
                      }
                    },
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 70.w,
                  right: 70.w,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.center,
                      image: AssetImage("assets/icons/line-full-1.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // BlocBuilder<NonPriorityCubit, NonPriorityState>(
                      //   builder: (context, state) {
                      //     if (state is CheckRefreshTokenSuccess) {
                      //       GetIt.I<NavigationServiceMain>()
                      //           .pushReplacementNamed('/monitor');
                      //     }
                      //     if (state is CheckRefreshTokenFailed) {
                      //       AwesomeDialog(
                      //               context: context,
                      //               autoHide: const Duration(seconds: 3),
                      //               dialogType: DialogType.WARNING,
                      //               animType: AnimType.RIGHSLIDE,
                      //               headerAnimationLoop: true,
                      //               title: 'Please login again.',
                      //               desc: 'Click OK to go on login page!',
                      //               btnOkOnPress: () {
                      //                 GetIt.I<NavigationServiceMain>()
                      //                     .pushReplacementNamed('/login');
                      //               },
                      //               btnOkIcon: Icons.cancel,
                      //               btnOkColor: Colors.yellow)
                      //           .show();
                      //     }
                      //     return Container();
                      //   },
                      // ),
                      BlocConsumer<NonPriorityCubit, NonPriorityState>(
                        listener: (context, state) {
                          if (state is NonPrioritySuccess) {
                            String energyNP = state.nonPrio.energy!;
                            var energyNonPrio =
                                double.parse(energyNP).toStringAsFixed(1);
                            energyNonPriority = energyNonPrio;
                          }
                        },
                        builder: (context, state) {
                          double doubleEP = double.parse(energyPriority);
                          double doubleENP = double.parse(energyNonPriority);
                          var mainLoad =
                              (doubleEP + doubleENP).toStringAsFixed(1);
                          if (mainLoad == '0.0') {
                            return CircleMonitorUp(
                              circleColor: Colors.grey,
                              numberColor: Colors.white,
                              img: 'assets/icons/home.png',
                              txt: '$mainLoad kWh',
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) =>
                                        const MainLoadDialog());
                              },
                            );
                          } else {
                            return CircleMonitorUp(
                              circleColor: home,
                              numberColor: Colors.white,
                              img: 'assets/icons/home.png',
                              txt: '$mainLoad kWh',
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) =>
                                        const MainLoadDialog());
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 27.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    BlocConsumer<BatteryCubit, BatteryState>(
                      listener: (context, state) {
                        if (state is BatterySuccess) {
                          String energyBMS = state.battery.energy!;
                          var energyB =
                              double.parse(energyBMS).toStringAsFixed(1);
                          energyBattery = energyB;
                        }
                      },
                      builder: (context, state) {
                        if (energyBattery == '0.0') {
                          return Badge(
                            elevation: 0,
                            position: BadgePosition.topEnd(),
                            padding: EdgeInsetsDirectional.only(
                                end: 15.sp, top: 8.sp),
                            badgeContent: Icon(
                              Icons.error,
                              size: 25.sp,
                              color: Colors.yellow,
                            ),
                            badgeColor: Colors.transparent,
                            child: CircleMonitorUp(
                              circleColor: Colors.grey,
                              numberColor: Colors.white,
                              img: 'assets/icons/ess.png',
                              txt: '0.0 kWh',
                              onTap: () {
                                AwesomeDialog(
                                        context: context,
                                        animType: AnimType.SCALE,
                                        dialogType: DialogType.WARNING,
                                        keyboardAware: true,
                                        showCloseIcon: true,
                                        body: const LogWidget())
                                    .show();
                              },
                            ),
                          );
                        } else {
                          return CircleMonitorUp(
                            circleColor: powerwall,
                            numberColor: Colors.white,
                            img: 'assets/icons/ess.png',
                            txt: '$energyBattery kWh',
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) =>
                                      const BatteryLoadDialog());
                            },
                          );
                        }
                      },
                    ),
                    SizedBox(width: 150.w),
                    BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, state) {
                        if (state is AccessGivenProfilSuccess) {
                          final totalRoutes = state.user.totalRoutes ?? 1;
                          if (totalRoutes == 0) {
                            return Container(
                                height: 20.sp,
                                width: 80.sp,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.sp),
                                  color: CustomColor.tertiary,
                                ),
                                child: Center(
                                  child: Text(
                                    'Add device!',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        color: CustomColor.onTertiary,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ));
                          } else {
                            return Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.settings),
                                  iconSize: 32.w,
                                  color: Colors.grey,
                                  splashColor: Colors.grey,
                                  onPressed: () {
                                    AwesomeDialog(
                                            context: context,
                                            animType: AnimType.SCALE,
                                            dialogType: DialogType.WARNING,
                                            keyboardAware: true,
                                            showCloseIcon: true,
                                            body: const FormChangeESSDevice())
                                        .show();
                                  },
                                ),
                              ],
                            );
                          }
                        }
                        return Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.settings),
                              iconSize: 32.w,
                              color: Colors.grey,
                              splashColor: Colors.grey,
                              onPressed: () {
                                AwesomeDialog(
                                        context: context,
                                        animType: AnimType.SCALE,
                                        dialogType: DialogType.WARNING,
                                        keyboardAware: true,
                                        showCloseIcon: true,
                                        body: const FormChangeESSDevice())
                                    .show();
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.w,
              ),
            ],
          ),
          detailMonitoring(context)
        ],
      ),
    );
  }

  Widget detailMonitoring(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _storage = GetStorage();

    String fullName = '';
    String kWh = '1400';

    var energyG = _storage.read(lastEnergyGrid) ?? '0';
    var energyP = _storage.read(lastEnergyPriority) ?? '0';
    var energyNP = _storage.read(lastEnergyNonPriority) ?? '0';
    final ppCubit = context.read<PricePacketCubit>();
    useEffect(() {
      Timer.periodic(
          const Duration(seconds: 2),
          (Timer t) => [
                // ppCubit.getkWhPacket(null),
                // energyG,
                // energyP,
                // energyNP,
              ]);

      return;
    }, [ppCubit]);

    return DraggableScrollableSheet(
        initialChildSize: .33.h,
        minChildSize: .32.h,
        maxChildSize: 1,
        snap: true,
        builder: (BuildContext context, ScrollController scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Container(
              height: 800.w,
              //color: CustomColor.primary,
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30.0)),
                color: CustomColor.primary,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 6.w,
                  ),
                  Container(
                    height: 6.w,
                    width: 90.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.w),
                        color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 1.w, bottom: 5.w, left: 16.w, right: 16.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            GetIt.I<NavigationServiceMain>()
                                .pushNamed('/profil');
                          },
                          child: CircleAvatar(
                            radius: 23.w,
                            backgroundColor: Colors.transparent,
                            backgroundImage:
                                const AssetImage('assets/images/p1.jpg'),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        BlocConsumer<ProfileCubit, ProfileState>(
                          listener: (context, state) {
                            if (state is ProfileSuccess) {
                              fullName = state.user.fullName!;
                            }
                          },
                          builder: (context, state) {
                            return Text(
                              fullName,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: CustomColor.onPrimary,
                                  fontSize: 20.w,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          width: 80.w,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.settings,
                          ),
                          iconSize: 25.w,
                          color: CustomColor.onPrimary,
                          onPressed: () {
                            GetIt.I<NavigationServiceMain>()
                                .pushNamed('/setting-screen');
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 5.w, bottom: 14.w, left: 10.w, right: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Renewable Energy Data',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: CustomColor.onPrimary,
                              fontSize: 17.w,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.w,
                        ),
                        Wrap(
                          spacing: 10.w,
                          runSpacing: 2.w,
                          children: [
                            const MonitorCard(
                              title: 'Total Energy Usage',
                              value: '155.02',
                              txt: 'kWh',
                            ),
                            BlocConsumer<PricePacketCubit, PricePacketState>(
                              listener: (context, state) {
                                if (state is PricePacketSuccess) {
                                  kWh = state.packet.perKwh ?? '1400';
                                }
                              },
                              builder: (context, state) {
                                double perkWh = double.parse(kWh);
                                double dEnergyG = double.parse(energyG);
                                double dEnergyP = double.parse(energyP);
                                double dEnergyNP = double.parse(energyNP);
                                double dEnergyPNP = (dEnergyP + dEnergyNP);

                                if (dEnergyPNP > dEnergyG) {
                                  double mainLoad = (dEnergyPNP) - (dEnergyG);

                                  double costSaving = (mainLoad * perkWh);

                                  var idrCostSaving =
                                      CurrencyFormat.convertToUS(costSaving, 0)
                                          .toString();
                                  return MonitorCard(
                                      title: 'Cost Saving',
                                      value: idrCostSaving,
                                      txt: 'Rupiah');
                                } else {
                                  double mainLoad = dEnergyG - dEnergyPNP;

                                  double costSaving = (mainLoad * perkWh);
                                  var idrCostSaving =
                                      CurrencyFormat.convertToUS(costSaving, 0)
                                          .toString();
                                  return MonitorCard(
                                      title: 'Cost Saving',
                                      value: ' $idrCostSaving',
                                      txt: 'Rupiah');
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Energy Usage Data',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 17.w,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const TabWidget(),
                  Text(
                    'Cost Saving Data',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 17.w,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const TabWidget(),
                ],
              ),
            ),
          );
        });
  }
}
