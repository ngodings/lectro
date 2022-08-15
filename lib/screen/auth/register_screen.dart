import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lectro/screen/auth/cubit/register_cubit.dart';

import '../../services/navigation.dart';
import '../../utils/constant.dart';
import '../../utils/custom.dart';
import '../components/button/small_button.dart';
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
    final registerCubit = context.read<RegisterCubit>();
    final showCubit = context.read<ShowPasswordCubit>();
    final fullNameC = TextEditingController();
    final usernameC = TextEditingController();
    final emailC = TextEditingController();
    final passwordC = TextEditingController();
    final rePasswordC = TextEditingController();
    final addressC = TextEditingController();
    final phoneC = TextEditingController();

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
                        right: 65.w,
                        left: 65.w,
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/icons/matador-lectro.png',
                          height: 200.h,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: TextFormField(
                        controller: fullNameC,
                        decoration: InputDecoration(
                          label: Text(
                            'Full Name',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: title,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          hintText: "Enter your fullname",
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
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
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
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: TextFormField(
                        controller: emailC,
                        decoration: InputDecoration(
                          label: Text(
                            'Email',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: title,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          hintText: "Enter your email.",
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
                        keyboardType: TextInputType.text,
                      ),
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
                                  showCubit.changeObscure(!obscure);
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
                              label: Text(
                                'Repeat Password',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    color: title,
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
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: TextFormField(
                        controller: addressC,
                        decoration: InputDecoration(
                          label: Text(
                            'Address',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: title,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          hintText: "Enter your address.",
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
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: TextFormField(
                        controller: phoneC,
                        decoration: InputDecoration(
                          label: Text(
                            'Phone Number',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: title,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          hintText: "(+62877xxxx)",
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
                        keyboardType: TextInputType.text,
                      ),
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
                          GetIt.I<NavigationServiceMain>().pushNamed('/login');
                        }
                        if (state is RegisterSuccess) {
                          GetIt.I<NavigationServiceMain>().pop();
                          GetIt.I<NavigationServiceMain>()
                              .pushNamed('/monitor');
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 210.w),
                        child: SmallButton(
                          buttonText: 'Register',
                          color: button,
                          textColor: Colors.white,
                          press: () async {},
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    InkWell(
                      onTap: () async {
                        GetIt.I<NavigationServiceMain>().pushNamed('/login');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Sudah  mempunyai akun? Masuk disini',
                            textAlign: TextAlign.left,
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                decoration: TextDecoration.underline,
                                color: button,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      'Daftar menggunakan',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: button,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/facebook-icon.png',
                        ),
                        SizedBox(
                          width: 8.w,
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
                            child: Image.asset(
                              'assets/icons/google-icon.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30.h),
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
