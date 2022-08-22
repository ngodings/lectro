import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

import '../../utils/theme_data.dart';
import 'cubit/register_code_cubit.dart';

class RegisterCodeScreen extends StatelessWidget {
  const RegisterCodeScreen(
      {Key? key,
      required this.email,
      required this.isEmail,
      required this.newCode})
      : super(key: key);
  final String email;
  final bool isEmail;
  final bool newCode;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCodeCubit(),
        ),
      ],
      child:
          _RegisterCodeScreen(email: email, isEmail: isEmail, newCode: newCode),
    );
  }
}

class _RegisterCodeScreen extends HookWidget {
  const _RegisterCodeScreen(
      {Key? key,
      required this.email,
      required this.isEmail,
      required this.newCode})
      : super(key: key);
  final String email;
  final bool isEmail;
  final bool newCode;

  @override
  Widget build(BuildContext context) {
    bool first = true;
    final codeC = useTextEditingController();
    final cubit = context.read<RegisterCodeCubit>();
    // final reqCubit = context.read<RequestCodeCubit>();
    int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60;
    return Scaffold(
      backgroundColor: CustomColor.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    BackButton(),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "Masukan Kode Verifikasi",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: CustomColor.onBackground,
                      fontSize: 22.w,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                Column(
                  children: [
                    Text(
                      "Kode autentikasi baru saja dikirimkan ke email ",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: CustomColor.onBackground,
                          fontSize: 12.w,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      email,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: CustomColor.onBackground,
                          fontSize: 12.w,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: PinCodeTextField(
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      inactiveColor: const Color(0xFF5C5C70),
                      selectedColor: const Color(0xFF5C5C70),
                      activeColor: const Color(0xFF5C5C70),
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      activeFillColor: Colors.white,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: 65,
                      fieldWidth: 48,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    controller: codeC,
                    onCompleted: (v) {
                      //  cubit.registerAuthCode(v, email);
                    },
                    onChanged: (v) {
                      print(v);
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");

                      return true;
                    },
                    appContext: context,
                  ),
                ),
                SizedBox(height: 16.h),
                HStack([
                  BlocBuilder<RegisterCodeCubit, RegisterCodeState>(
                    builder: (context, state) {
                      if (state is RegisterCodeTimersEnd) {
                        return GestureDetector(
                          onTap: () {
                            //  reqCubit.requestCodeAuthCode(email);
                          },
                          child: Text(
                            "Kirim ulang code",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: CustomColor.primary,
                                fontSize: 12.w,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      }
                      if (state is RegisterCodeTimersStart) {
                        return Text(
                          "Kirim ulang code",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: CustomColor.primary,
                              fontSize: 12.w,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }
                      return Text(
                        "Kirim ulang code",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: CustomColor.primary,
                            fontSize: 12.w,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    },
                  ),
                  BlocBuilder<RegisterCodeCubit, RegisterCodeState>(
                    builder: (context, state) {
                      return CountdownTimer(
                        widgetBuilder: (context, time) {
                          if (time == null) {
                            return Container();
                          } else {
                            final min = time.min ?? '00';
                            final sec = time.sec != null
                                ? (time.sec! < 10 ? '0${time.sec}' : time.sec)
                                : '00';
                            // return ':'.text.make();
                            return '$min:$sec'.text.make().pOnly(left: 16);
                          }
                        },
                        onEnd: () => cubit.timersEnd(),
                        endTime: endTime,
                      );
                    },
                  ),
                ]),
                SizedBox(
                  height: 30.h,
                ),
                GestureDetector(
                  onTap: () {
                    // cubit.registerAuthCode(codeC.text, email);
                  },
                  child: Container(
                    height: 36,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: CustomColor.primary,
                    ),
                    child: Center(
                      child: Text(
                        'Daftar',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: CustomColor.onPrimary,
                        ),
                      ),
                    ),
                  ),
                ).px24(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
