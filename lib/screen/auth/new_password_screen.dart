import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lectro/screen/auth/cubit/show_password_cubit.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/constant.dart';
import '../components/button/small_button.dart';
import '../components/title/logo_title.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShowPasswordCubit(),
        ),
      ],
      child: const NewPassword(),
    );
  }
}

class NewPassword extends HookWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usernameC = TextEditingController();
    final emailC = TextEditingController();

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
                          right: 65.w, left: 65.w, top: 40.w, bottom: 40.h),
                      child: const Center(
                        child: Logo(),
                      ),
                    ),
                    Text(
                      'Apply for new password',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: title,
                          fontSize: 15.w,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 35.w),
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
                          hintText: "Input your username",
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
                          hintText: "Input your email",
                          hintStyle: const TextStyle(color: Colors.grey),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          suffixIcon: const Icon(
                            Icons.mail,
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
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 210),
                      child: SmallButton(
                        buttonText: 'Contact Us',
                        color: button,
                        textColor: Colors.white,
                        press: () async {
                          var phone = '6285171520201';
                          var email = emailC.text;
                          var username = usernameC.text;
                          var msg =
                              'Halo Lectro, saya pengguna Energy Smart Energy System (ESS) dengan username $username dan email $email. Saya ingin mengajukan penggantian password. Terimakasih!';
                          final chatme = WhatsAppUnilink(
                            phoneNumber: phone,
                            text: msg,
                          );
                          // ignore: deprecated_member_use
                          await launch('$chatme');
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 150.0),
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
