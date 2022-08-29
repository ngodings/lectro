import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/theme_data.dart';

class ViewableTextField extends StatelessWidget {
  const ViewableTextField(
      {Key? key,
      required this.label,
      required this.hintText,
      required this.readOnly})
      : super(key: key);
  final String label, hintText;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            label,
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
            readOnly: true,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 14.w, horizontal: 12.w),
              hintText: hintText,
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
          ),
        ],
      ),
    );
  }
}

class NonViewableTextField extends StatelessWidget {
  const NonViewableTextField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.keyboardType,
  }) : super(key: key);
  final String label, hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            label,
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
            controller: controller,
            readOnly: false,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 14.w, horizontal: 12.w),
              hintText: hintText,
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
            keyboardType: keyboardType,
          ),
        ],
      ),
    );
  }
}
