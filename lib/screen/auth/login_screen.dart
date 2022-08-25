import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:lectro/screen/auth/cubit/login_cubit.dart';
import 'package:lectro/screen/components/button/default_button.dart';
import 'package:lectro/services/navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lectro/utils/custom.dart';
import 'package:lectro/utils/theme_data.dart';

import 'cubit/show_password_cubit.dart';
import 'cubit/validator_cubit.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => ShowPasswordCubit(),
        ),
        BlocProvider(
          create: (context) => ValidatorCubit(),
        )
      ],
      child: const Login(),
    );
  }
}

class Login extends HookWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _showCubit = context.read<ShowPasswordCubit>();
    // ignore: no_leading_underscores_for_local_identifiers
    final _loginCubit = context.read<LoginCubit>();
    final validCubit = context.read<ValidatorCubit>();

    final usernameC = TextEditingController();
    final passwordC = TextEditingController();

    bool isLoginable = false;
    bool obscure = true;
    return Scaffold(
      body: Container(
        height: 1200,
        color: CustomColor.background,
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: 65.w,
                        left: 65.w,
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/icons/matador-lectro.png',
                          height: 180.h,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Sign In',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: TextFormField(
                        controller: usernameC,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.w, horizontal: 12.w),
                          label: Text(
                            'Username or Email',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: CustomColor.onSurfaceVariant,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          hintText: "Enter your Username or Email",
                          hintStyle: const TextStyle(color: Colors.grey),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: const Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: CustomColor.primary,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onChanged: (text) {
                          if (usernameC.text.isNotEmpty &&
                              passwordC.text.isNotEmpty) {
                            validCubit.changeButtonState(true);
                          } else {
                            validCubit.changeButtonState(false);
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(height: 16),
                    BlocConsumer<ShowPasswordCubit, ShowPasswordState>(
                      listener: (context, state) {
                        if (state is ChangeObscure) {
                          obscure = state.value;
                        }
                      },
                      builder: (context, state) {
                        return Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: TextFormField(
                            controller: passwordC,
                            obscureText: obscure,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.w, horizontal: 12.w),
                              label: Text(
                                'Password',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: CustomColor.onSurfaceVariant,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              hintText: "Enter your Password",
                              hintStyle: const TextStyle(color: Colors.grey),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              suffixIcon: GestureDetector(
                                child: Icon(
                                  obscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onTap: () {
                                  _showCubit.changeObscure(!obscure);
                                },
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: CustomColor.primary,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onChanged: (text) {
                              if (usernameC.text.isNotEmpty &&
                                  passwordC.text.isNotEmpty) {
                                validCubit.changeButtonState(true);
                              } else {
                                validCubit.changeButtonState(false);
                              }
                            },
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 12.h),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 212),
                    //   child: InkWell(
                    //     onTap: () async {
                    //       GetIt.I<NavigationServiceMain>()
                    //           .pushNamed('/forget-password');
                    //     },
                    //     child: Text(
                    //       'Forget Password',
                    //       textAlign: TextAlign.left,
                    //       style: GoogleFonts.poppins(
                    //         textStyle: const TextStyle(
                    //           color: button,
                    //           fontSize: 14,
                    //           fontWeight: FontWeight.w700,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Doesn't have account? ",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            GetIt.I<NavigationServiceMain>()
                                .pushNamed('/register');
                          },
                          child: Text(
                            'Register',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: CustomColor.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    BlocConsumer<ValidatorCubit, ValidatorState>(
                      listener: (context, state) {
                        if (state is ChangeButtonState) {
                          isLoginable = state.buttonState;
                        }
                        if (state is ValidateOnLogin) {
                          if (state.validateEmail && state.validatePassword) {
                            _loginCubit.login(usernameC.text, passwordC.text);
                          }
                        }
                      },
                      builder: (context, state) {
                        return BlocListener<LoginCubit, LoginState>(
                          listener: (context, state) {
                            if (state is LoginLoading) {
                              CustomDialog.showLoadingDialog(context);
                              GetIt.I<NavigationServiceMain>().pop();
                            }

                            if (state is LoginFailed) {
                              GetIt.I<NavigationServiceMain>().pop();
                              GetIt.I<NavigationServiceMain>()
                                  .pushNamed('/login');
                            }
                            if (state is LoginSuccess) {
                              GetIt.I<NavigationServiceMain>().pop();
                              GetIt.I<NavigationServiceMain>()
                                  .pushNamed('/monitor');
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 4.w, right: 4.w),
                            child: LongButton(
                              colorBox: isLoginable
                                  ? CustomColor.primary
                                  : Colors.black38,
                              color: CustomColor.onPrimary,
                              txtButton: 'Sign In',
                              onTap: () {
                                if (isLoginable) {
                                  validCubit.validateOnLogin(usernameC.text,
                                      usernameC.text, passwordC.text);
                                }
                                _loginCubit.login(
                                    usernameC.text, passwordC.text);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/line-1.png'),
                        Text(
                          " OR ",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Image.asset('assets/icons/line-1.png'),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    BlocListener<LoginCubit, LoginState>(
                      listener: (context, state) {
                        if (state is LoginLoading) {
                          CustomDialog.showLoadingDialog(context);
                        }
                        if (state is LoginFailed) {
                          GetIt.I<NavigationServiceMain>().pop();
                          GetIt.I<NavigationServiceMain>().pushNamed('/login');
                        }
                        if (state is LoginSuccess) {
                          GetIt.I<NavigationServiceMain>().pop();
                          GetIt.I<NavigationServiceMain>()
                              .pushNamed('/monitor');
                        }
                      },
                      child: InkWell(
                        onTap: () {
                          _loginCubit.signInGoogle();
                        },
                        child: Container(
                          height: 36.w,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.6),
                                    // spreadRadius: 0.5,
                                    blurRadius: 2,
                                    offset: const Offset(2, 4),
                                    blurStyle: BlurStyle
                                        .inner // changes position of shadow
                                    ),
                              ],
                              borderRadius: BorderRadius.circular(6.w),
                              color: CustomColor.onPrimary),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 10.w,
                                ),
                                Image.asset('assets/icons/logo-google.png'),
                                SizedBox(
                                  width: 60.w,
                                ),
                                Text(
                                  'Sign In With Google',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     BlocListener<LoginCubit, LoginState>(
                    //       listener: (context, state) {
                    //         if (state is LoginLoading) {
                    //           CustomDialog.showLoadingDialog(context);
                    //         }
                    //         if (state is LoginFailed) {
                    //           GetIt.I<NavigationServiceMain>().pop();
                    //           GetIt.I<NavigationServiceMain>()
                    //               .pushNamed('/login');
                    //         }
                    //         if (state is LoginSuccess) {
                    //           GetIt.I<NavigationServiceMain>().pop();
                    //           GetIt.I<NavigationServiceMain>()
                    //               .pushNamed('/monitor');
                    //         }
                    //       },
                    //       child: InkWell(
                    //         onTap: () {
                    //           _loginCubit.signInFB();
                    //         },
                    //         child: Image.asset(
                    //           'assets/icons/facebook-icon.png',
                    //         ),
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: 8.w,
                    //     ),
                    //     BlocListener<LoginCubit, LoginState>(
                    //       listener: (context, state) {
                    //         if (state is LoginLoading) {
                    //           CustomDialog.showLoadingDialog(context);
                    //         }
                    //         if (state is LoginFailed) {
                    //           GetIt.I<NavigationServiceMain>().pop();
                    //           GetIt.I<NavigationServiceMain>()
                    //               .pushNamed('/login');
                    //         }
                    //         if (state is LoginSuccess) {
                    //           GetIt.I<NavigationServiceMain>().pop();
                    //           GetIt.I<NavigationServiceMain>()
                    //               .pushNamed('/monitor');
                    //         }
                    //       },
                    //       child: InkWell(
                    //         onTap: () {
                    //           _loginCubit.signInGoogle();
                    //         },
                    //         child: Image.asset(
                    //           'assets/icons/google-icon.png',
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 30.h),
                        child: Image.asset('assets/icons/slogan.png',
                            height: 100.w),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
