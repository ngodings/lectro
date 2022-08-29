import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lectro/utils/theme_data.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../services/navigation.dart';
import '../auth/cubit/profile_cubit.dart';
import '../components/button/default_button.dart';
import '../components/form/viewable_field.dart';

class EditProfileScreen extends HookWidget {
  const EditProfileScreen({
    Key? key,
    required this.fullName,
    required this.phone,
    required this.address,
    required this.username,
    required this.aboutMe,
  }) : super(key: key);

  final String fullName, phone, address, username, aboutMe;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileCubit(),
        ),
      ],
      child: _EditProfileScreen(
        fullName: fullName,
        aboutMe: aboutMe,
        address: address,
        phone: phone,
        username: username,
      ),
    );
  }
}

class _EditProfileScreen extends HookWidget {
  const _EditProfileScreen({
    Key? key,
    required this.fullName,
    required this.phone,
    required this.address,
    required this.username,
    required this.aboutMe,
  }) : super(key: key);
  final String fullName, phone, address, username, aboutMe;

  @override
  Widget build(BuildContext context) {
    final fullNameC = TextEditingController();
    final usernameC = TextEditingController();
    final aboutC = TextEditingController();
    final addressC = TextEditingController();
    final phoneC = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          color: CustomColor.background,
          child: Padding(
            padding: EdgeInsets.only(
                top: 45.w, bottom: 5.w, left: 20.w, right: 20.w),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        GetIt.I<NavigationServiceMain>().pop();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 21.w,
                        color: CustomColor.secondary,
                      ),
                    ),
                    const SizedBox(
                      width: 0,
                    ),
                    // Text(
                    //   'Profile',
                    //   style: GoogleFonts.montserrat(
                    //     textStyle: TextStyle(
                    //       color: CustomColor.secondary,
                    //       fontSize: 16.w,
                    //       fontWeight: FontWeight.w700,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(
                  height: 30.w,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.w, right: 30.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'About me',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: CustomColor.onBackground,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      TextFormField(
                        controller: aboutC,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        expands: true,
                        textAlignVertical: TextAlignVertical.top,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 14.w, horizontal: 12.w),
                          hintText: aboutMe,
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: CustomColor.secondary,
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
                      ).h(150.h),
                      SizedBox(
                        height: 5.h,
                      ),
                      NonViewableTextField(
                        label: 'Username',
                        hintText: username,
                        controller: usernameC,
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      NonViewableTextField(
                        label: 'Full Name',
                        hintText: fullName,
                        controller: fullNameC,
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      NonViewableTextField(
                        label: 'Phone Number',
                        hintText: phone,
                        controller: phoneC,
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      NonViewableTextField(
                        label: 'Address',
                        hintText: address,
                        controller: addressC,
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.w, right: 15.w),
                        child: LongButton(
                          colorBox: CustomColor.primary,
                          color: CustomColor.onPrimary,
                          txtButton: 'Edit',
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
