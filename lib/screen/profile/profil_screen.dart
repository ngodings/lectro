import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lectro/screen/auth/cubit/profile_cubit.dart';
import 'package:lectro/screen/components/form/viewable_field.dart';
import 'package:lectro/utils/custom.dart';
import 'package:lectro/utils/theme_data.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../services/navigation.dart';
import '../components/loading/loading_widget.dart';

class ProfileScreen extends HookWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileCubit(),
        ),
      ],
      child: const Profile(),
    );
  }
}

class Profile extends HookWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dCubit = context.read<ProfileCubit>();

    useEffect(() {
      dCubit.getProfile(null);
      return;
    }, [dCubit]);

    // ignore: unused_local_variable
    String email = '';
    String fullName = '';
    String phone = '';
    String address = '';
    String username = '';
    String aboutMe = '';

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          // height: MediaQuery.of(context).size.height,
          color: CustomColor.background,
          child: Padding(
            padding: EdgeInsets.only(
                top: 45.w, bottom: 5.w, left: 15.w, right: 15.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileSuccess) {
                      email = state.user.email ?? 'fill your email here!';
                      username = state.user.username ?? "Username";
                      aboutMe = state.user.about ?? "About me";
                      phone = state.user.phone ?? "Phone";
                      address = state.user.address ?? "Address";
                      fullName = state.user.fullName ?? "Full Name";
                      return Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  GetIt.I<NavigationServiceMain>()
                                      .pushNamed('/monitor');
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
                              Text(
                                'Profile',
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    color: CustomColor.secondary,
                                    fontSize: 16.w,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  CustomAwesomeDialog.showAskedDialog(
                                      context,
                                      'Sign out!',
                                      'Are you sure to logout on this app?',
                                      () {
                                    dCubit.signOut();
                                  });
                                },
                                child: Text(
                                  'Sign Out',
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: CustomColor.secondary,
                                      fontSize: 16.w,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30.w,
                          ),
                          Center(
                            child: CircleAvatar(
                              radius: 80.w,
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  const AssetImage('assets/images/p1.jpg'),
                            ),
                          ),
                          SizedBox(
                            height: 15.w,
                          ),
                          InkWell(
                            onTap: () {
                              GetIt.I<NavigationServiceMain>()
                                  .pushNamed('/edit-profile', args: {
                                'username': username,
                                'fullName': fullName,
                                'phone': phone,
                                'address': address,
                                'aboutMe': aboutMe
                              });
                            },
                            child: Text(
                              'Edit Profile',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: CustomColor.primary,
                                  fontSize: 16.w,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.w,
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
                                TextField(
                                  readOnly: true,
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
                                ViewableTextField(
                                  label: 'Username',
                                  hintText: username,
                                  readOnly: true,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                ViewableTextField(
                                  label: 'Full Name',
                                  hintText: fullName,
                                  readOnly: true,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                ViewableTextField(
                                  label: 'Phone Number',
                                  hintText: phone,
                                  readOnly: true,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                ViewableTextField(
                                  label: 'Address',
                                  hintText: address,
                                  readOnly: true,
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                    return Column(
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
                            SizedBox(
                              height: 8.w,
                            ),
                            Text(
                              'Profile',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: CustomColor.secondary,
                                  fontSize: 16.w,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                CustomAwesomeDialog.showAskedDialog(
                                    context,
                                    'Sign out!',
                                    'Are you sure to logout on this app?', () {
                                  dCubit.signOut();
                                });
                              },
                              child: Text(
                                'Sign Out',
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: CustomColor.secondary,
                                    fontSize: 16.w,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const CustomLoadingWidget()
                      ],
                    );
                  },
                ),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: 8.w, right: 10.w, left: 10.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Beta Version 1.0.0',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: CustomColor.primary,
                            fontSize: 12.w,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.headset_mic),
                            iconSize: 35.w,
                            color: CustomColor.primary,
                            splashColor: CustomColor.primary,
                            onPressed: () {
                              settingModalBottomSheet(context);
                            },
                          ),
                          Text(
                            'Help',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: CustomColor.primary,
                                fontSize: 13.w,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
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

  void settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: 150.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  const Color(0xFF775FD1).withOpacity(1),
                  const Color(0xFF1C1B33).withOpacity(1),
                ],
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 6.w,
                ),
                Container(
                  height: 5.w,
                  width: 70.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.w),
                      color: Colors.white.withOpacity(0.7)),
                ),
                SizedBox(
                  height: 14.w,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5.w,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.whatsapp,
                              color: Colors.white.withOpacity(0.8),
                              size: 24.w,
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            Text(
                              'Contact Us',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 15.w,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.picture_as_pdf,
                              color: Colors.white.withOpacity(0.8),
                              size: 24.w,
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            Text(
                              'Download Manual Guide',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 15.w,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.wordpress_outlined,
                              color: Colors.white.withOpacity(0.8),
                              size: 24.w,
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            Text(
                              'Visit lectro.id',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 15.w,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
