import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lectro/utils/theme_data.dart';

import '../../services/navigation.dart';
import '../../utils/constant.dart';
import '../../utils/custom.dart';
import '../components/button/small_button.dart';
import '../components/form/custom_field.dart';
import 'cubit/profile_cubit.dart';

class CompleteProfileScreen extends HookWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileCubit(),
        )
      ],
      child: const _CompleteProfileScreen(),
    );
  }
}

class _CompleteProfileScreen extends HookWidget {
  const _CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileCubit>();
    final addressC = TextEditingController();
    final phoneC = TextEditingController();
    final usernameC = TextEditingController();
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: CustomColor.background,
        child: SafeArea(
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
                  Center(
                    child: Text(
                      'Complete your profile before!',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: title,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  BasicTextField(
                    controller: usernameC,
                    label: 'Username',
                    hintText: 'Enter your username.',
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  BasicTextField(
                    controller: addressC,
                    label: 'Username',
                    hintText: 'Enter your username.',
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  BasicTextField(
                      controller: phoneC,
                      label: 'Phone Number',
                      hintText: '+62877xxxxxxxxx',
                      keyboardType: TextInputType.phone),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 210.w),
                    child: BlocListener<ProfileCubit, ProfileState>(
                      listener: (context, state) {
                        if (state is ProfileLoading) {
                          CustomDialog.showLoadingDialog(context);
                        }
                        if (state is ProfileFailed) {
                          GetIt.I<NavigationServiceMain>().pop();
                          GetIt.I<NavigationServiceMain>()
                              .pushNamed('/complete-profile');
                        }
                        if (state is CompleteProfileSuccess) {
                          GetIt.I<NavigationServiceMain>().pop();
                          GetIt.I<NavigationServiceMain>()
                              .pushNamed('/scan-barcode');
                          // GetIt.I<NavigationServiceMain>()
                          //     .pushNamed('/monitor');
                        }
                      },
                      child: SmallButton(
                        buttonText: 'Submit',
                        color: button,
                        textColor: Colors.white,
                        press: () async {
                          cubit.updateCompleteProfile(
                              usernameC.text, addressC.text, phoneC.text);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
