import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lectro/screen/auth/cubit/profile_cubit.dart';

import '../../services/navigation.dart';
import '../components/form/field_form.dart';
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

    String email = '';
    String username = '';

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0.w),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFF9999CB),
                Color(0xFFa09ab9),
                Color(0xFF8073a2),
                Color(0xFF7c6d9e)
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                top: 42.w, bottom: 5.w, left: 12.w, right: 12.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    if (state is ProfileSuccess) {
                      email = state.user.email!;
                      username = state.user.username!;
                      return Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Profile',
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    fontSize: 20.w,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.close_sharp),
                                iconSize: 35.w,
                                color: Colors.white.withOpacity(0.7),
                                splashColor: Colors.white.withOpacity(0.7),
                                onPressed: () {
                                  GetIt.I<NavigationServiceMain>().pop();
                                },
                              ),
                            ],
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
                            height: 30.w,
                          ),
                          FieldViewable(
                            title: 'Username',
                            field: username,
                          ),
                          FieldViewable(
                            title: 'Email',
                            field: email,
                          )
                        ],
                      );
                    }

                    return Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Profile',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 20.w,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close_sharp),
                              iconSize: 35.w,
                              color: Colors.white.withOpacity(0.7),
                              splashColor: Colors.white.withOpacity(0.7),
                              onPressed: () {
                                GetIt.I<NavigationServiceMain>().pop();
                              },
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
                        'Beta Version',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Colors.white.withOpacity(0.4),
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
                            color: Colors.white.withOpacity(0.7),
                            splashColor: Colors.white.withOpacity(0.7),
                            onPressed: () {
                              settingModalBottomSheet(context);
                            },
                          ),
                          Text(
                            'Help',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.white.withOpacity(0.8),
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
