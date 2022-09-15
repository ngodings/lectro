import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lectro/screen/components/form/viewable_field.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../services/navigation.dart';
import '../../utils/theme_data.dart';
import '../auth/cubit/show_password_cubit.dart';
import '../components/button/default_button.dart';

class ScanBarcodeScreen extends HookWidget {
  const ScanBarcodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShowPasswordCubit(),
        ),
      ],
      child: const _ScanBarcodeScreen(),
    );
  }
}

class _ScanBarcodeScreen extends StatefulWidget {
  const _ScanBarcodeScreen({Key? key}) : super(key: key);

  @override
  State<_ScanBarcodeScreen> createState() => __ScanBarcodeScreenState();
}

class __ScanBarcodeScreenState extends State<_ScanBarcodeScreen> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  final textC = TextEditingController();
  QRViewController? controller;
  Barcode? barcode;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();

    if (Platform.isAndroid) {
      await controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 40.sp,
            left: 20.sp,
            right: 20.sp,
          ),
          child: Container(
            color: CustomColor.background,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        GetIt.I<NavigationServiceMain>()
                            .pushReplacementNamed('/monitor');
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 21.w,
                        color: CustomColor.secondary,
                      ),
                    ),
                    SizedBox(
                      width: 110.w,
                    ),
                    Text(
                      'Profile',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: CustomColor.onSurfaceVariant,
                          fontSize: 16.w,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Scan QR Code of the ESS device',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: CustomColor.onBackground,
                      fontSize: 18.w,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    color: CustomColor.background,
                  ),
                  width: 280.sp,
                  height: 280.sp,
                  child: buildQRView(context),
                ),
                SizedBox(
                  height: 12.sp,
                ),
                SizedBox(
                  height: 10.sp,
                ),
                NonViewableTextField(
                  label: 'Input Serial Number',
                  hintText: 'NYXXXXX',
                  controller: textC,
                ),
                Padding(
                  padding: EdgeInsets.all(12.sp),
                  child: LongButton(
                    colorBox: CustomColor.primary,
                    color: CustomColor.onPrimary,
                    txtButton: 'Continue',
                    onTap: () {},
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                InkWell(
                  onTap: (() {}),
                  child: Text(
                    "Enter with demo instead",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: CustomColor.primary,
                        fontSize: 10.w,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildResult() => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: CustomColor.primary),
        child: Text(
          // ignore: unnecessary_null_comparison
          barcode != null ? 'Result : ${barcode?.code}' : 'Scan a code!',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: CustomColor.onBackground,
              fontSize: 12.w,
              fontWeight: FontWeight.w700,
            ),
          ),
          maxLines: 3,
        ),
      );

  Widget buildQRView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderRadius: 15.sp,
          borderColor: Colors.green,
          borderWidth: 5,
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
        ),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((barcode) {
      setState(() {
        this.barcode = barcode;
      });
    });
  }
}
