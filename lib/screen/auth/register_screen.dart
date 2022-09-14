import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lectro/screen/auth/cubit/register_cubit.dart';
import 'package:lectro/screen/components/button/default_button.dart';
import 'package:lectro/screen/components/form/custom_field.dart';

import '../../services/navigation.dart';
import '../../utils/custom.dart';
import '../../utils/theme_data.dart';
import 'cubit/show_password_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => ShowPasswordCubit(),
        ),
      ],
      child: const _RegisterScreen(),
    );
  }
}

class _RegisterScreen extends HookWidget {
  const _RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool darkModeOn = brightness == Brightness.dark;
    final registerCubit = context.read<RegisterCubit>();
    final showCubit = context.read<ShowPasswordCubit>();
    final TextEditingController fullNameC = TextEditingController();
    final TextEditingController usernameC = TextEditingController();
    final TextEditingController emailC = TextEditingController();
    final TextEditingController passwordC = TextEditingController();
    final TextEditingController rePasswordC = TextEditingController();
    final TextEditingController addressC = TextEditingController();
    final TextEditingController phoneC = TextEditingController();

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
                          (darkModeOn)
                              ? 'assets/icons/matador-lectro-white.png'
                              : 'assets/icons/matador-lectro.png',
                          height: 180.h,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Register',
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
                    BasicTextField(
                      controller: usernameC,
                      label: 'Username',
                      hintText: 'Enter your username',
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 10.h),
                    BasicTextField(
                      controller: fullNameC,
                      label: 'Fullname',
                      hintText: 'Enter your fullname',
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 10.h),
                    BasicTextField(
                      controller: emailC,
                      label: 'Email',
                      hintText: 'Enter your email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 10.h),
                    BasicTextField(
                      controller: addressC,
                      label: 'Address',
                      hintText: 'Enter your adress',
                      keyboardType: TextInputType.multiline,
                    ),
                    SizedBox(height: 10.h),
                    BasicTextField(
                      controller: phoneC,
                      label: 'Phone Number',
                      hintText: '+62877xxxxxxxxx',
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
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
                                  showCubit.changeObscure(!obscure);
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
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
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
                            controller: rePasswordC,
                            obscureText: obscure,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.w, horizontal: 12.w),
                              label: Text(
                                'Repeat Password',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: CustomColor.onSurfaceVariant,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              hintText: "Enter your Password again",
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
                                  showCubit.changeObscure(!obscure);
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
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Have account? ",
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
                                .pushNamed('/login');
                          },
                          child: Text(
                            'login',
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
                    BlocListener<RegisterCubit, RegisterState>(
                      listener: (context, state) {
                        if (state is RegisterLoading) {
                          CustomDialog.showLoadingDialog(context);
                        }
                        if (state is RegisterFailed) {
                          GetIt.I<NavigationServiceMain>().pop();
                        }
                        if (state is RegisterResponseSuccess) {
                          if (emailC.text == '') {
                            GetIt.I<NavigationServiceMain>()
                                .pushNamed('/login');
                          } else {
                            GetIt.I<NavigationServiceMain>()
                                .pushNamed('/register-code', args: {
                              'username': usernameC.text,
                              'timestamp': state.response.timestamp,
                              'email': emailC.text,
                              'isEmail': true,
                              'newCode': false
                            });
                          }
                          //GetIt.I<NavigationServiceMain>().pushNamed('/login');
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 4.w, right: 4.w),
                        child: LongButton(
                          colorBox: CustomColor.primary,
                          color: CustomColor.onPrimary,
                          txtButton: 'Register',
                          onTap: () {
                            registerCubit.registerBasic(
                              fullNameC.text,
                              usernameC.text,
                              emailC.text,
                              passwordC.text,
                              rePasswordC.text,
                              addressC.text,
                              phoneC.text,
                            );
                          },
                        ),
                      ),
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
                    BlocListener<RegisterCubit, RegisterState>(
                      listener: (context, state) {
                        if (state is RegisterLoading) {
                          CustomDialog.showLoadingDialog(context);
                        }
                        if (state is RegisterFailed) {
                          GetIt.I<NavigationServiceMain>().pop();
                          GetIt.I<NavigationServiceMain>()
                              .pushNamed('/register');
                        }
                        if (state is RegisterSuccess) {
                          GetIt.I<NavigationServiceMain>().pop();
                          GetIt.I<NavigationServiceMain>()
                              .pushNamed('/complete-profile');
                        }
                      },
                      child: InkWell(
                        onTap: () {
                          registerCubit.signUpWithGoogle();
                        },
                        child: Container(
                          height: 36.w,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.6),
                                    blurRadius: 2,
                                    offset: const Offset(2, 4),
                                    blurStyle: BlurStyle.inner),
                              ],
                              borderRadius: BorderRadius.circular(12.w),
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
                                  'Register With Google',
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
                    //     BlocListener<RegisterCubit, RegisterState>(
                    //       listener: (context, state) {
                    //         if (state is RegisterLoading) {
                    //           CustomDialog.showLoadingDialog(context);
                    //         }
                    //         if (state is RegisterFailed) {
                    //           GetIt.I<NavigationServiceMain>().pop();
                    //           GetIt.I<NavigationServiceMain>()
                    //               .pushNamed('/register');
                    //         }
                    //         if (state is RegisterSuccess) {
                    //           GetIt.I<NavigationServiceMain>().pop();
                    //           GetIt.I<NavigationServiceMain>()
                    //               .pushNamed('/complete-profile');
                    //         }
                    //       },
                    //       child: InkWell(
                    //         onTap: () {
                    //           registerCubit.signUpWithFacebook();
                    //         },
                    //         child: Image.asset(
                    //           'assets/icons/facebook-icon.png',
                    //         ),
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: 8.w,
                    //     ),
                    //     BlocListener<RegisterCubit, RegisterState>(
                    //       listener: (context, state) {
                    //         if (state is RegisterLoading) {
                    //           CustomDialog.showLoadingDialog(context);
                    //         }
                    //         if (state is RegisterFailed) {
                    //           GetIt.I<NavigationServiceMain>().pop();
                    //           GetIt.I<NavigationServiceMain>()
                    //               .pushNamed('/register');
                    //         }
                    //         if (state is RegisterSuccess) {
                    //           GetIt.I<NavigationServiceMain>().pop();
                    //           GetIt.I<NavigationServiceMain>()
                    //               .pushNamed('/complete-profile');
                    //         }
                    //       },
                    //       child: InkWell(
                    //         onTap: () {
                    //           registerCubit.signUpWithGoogle();
                    //         },
                    //         child: Image.asset(
                    //           'assets/icons/google-icon.png',
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 30.h),
                        child: Image.asset(
                            (darkModeOn)
                                ? 'assets/icons/slogan-white.png'
                                : 'assets/icons/slogan.png',
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
