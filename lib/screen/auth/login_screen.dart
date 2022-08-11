import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:lectro/screen/auth/cubit/login_cubit.dart';
import 'package:lectro/screen/components/button/small_button.dart';
import 'package:lectro/screen/components/title/logo_title.dart';
import 'package:lectro/services/navigation.dart';
import 'package:lectro/utils/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lectro/utils/custom.dart';

import 'cubit/show_password_cubit.dart';

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

    final usernameC = TextEditingController();
    final passwordC = TextEditingController();

    bool obscure = true;
    return Scaffold(
      body: Container(
        height: 1200,
        color: Colors.white10,
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: 65.w, left: 65.w, top: 40.w, bottom: 50.h),
                      child: const Center(
                        child: Logo(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: TextFormField(
                        controller: usernameC,
                        decoration: InputDecoration(
                          label: Text(
                            'Username',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: title,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          hintText: "Enter your username",
                          hintStyle: const TextStyle(color: Colors.grey),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: const Icon(
                            Icons.person,
                            color: Colors.grey,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF7E68D4),
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF95D1A9),
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
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
                              label: Text(
                                'Password',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: title,
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
                                borderSide: const BorderSide(
                                  color: Color(0xFF7E68D4),
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFF95D1A9),
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    Padding(
                        padding: const EdgeInsets.only(left: 210),
                        child: InkWell(
                          onTap: () async {
                            GetIt.I<NavigationServiceMain>()
                                .pushNamed('/forget-password');
                          },
                          child: Text(
                            'Forget Password',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: button,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        )),
                    BlocListener<LoginCubit, LoginState>(
                      listener: (context, state) {
                        if (state is LoginLoading) {
                          CustomDialog.showLoadingDialog(context);
                          // const CustomLoadingDialogWidget();
                          // GetIt.I<NavigationServiceMain>().pop();
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
                      child: Padding(
                        padding: const EdgeInsets.only(right: 210),
                        child: SmallButton(
                          buttonText: 'Login',
                          color: button,
                          textColor: Colors.white,
                          press: () async {
                            _loginCubit.login(usernameC.text, passwordC.text);
                          },
                        ),
                      ),
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
                      child: IconButton(
                          onPressed: () async {
                            _loginCubit.loginFB();
                          },
                          icon: const Icon(Icons.login)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 130.0),
                      child:
                          Image.asset('assets/icons/slogan.png', height: 100.w),
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
