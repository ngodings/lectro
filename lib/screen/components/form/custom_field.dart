import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lectro/utils/theme_data.dart';

class BasicTextField extends StatelessWidget {
  const BasicTextField(
      {Key? key,
      required this.controller,
      this.keyboardType,
      required this.label,
      required this.hintText})
      : super(key: key);
  final String label, hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 15.w, horizontal: 12.w),
          label: Text(
            label,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: CustomColor.onSurfaceVariant,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          floatingLabelBehavior: FloatingLabelBehavior.always,
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
        keyboardType: keyboardType,
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.hintText,
      this.obscureText,
      this.prefix,
      this.suffix,
      required this.onChange,
      required this.controller,
      this.keyboardType})
      : super(key: key);
  final String? hintText;
  final bool? obscureText;
  final Widget? prefix;
  final Widget? suffix;
  final Function(String) onChange;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final String _hintText = hintText ?? '';
    // ignore: no_leading_underscores_for_local_identifiers
    final bool _obscureText = obscureText ?? false;
    // ignore: no_leading_underscores_for_local_identifiers
    final TextInputType _keyboardType = keyboardType ?? TextInputType.text;

    return Container(
      decoration: BoxDecoration(
        color: CustomColor.background,
        border: Border.all(color: const Color(0xFF7D7D8D), width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 12.h,
            width: 12.w,
          ),
          prefix != null ? prefix! : Container(),
          prefix != null
              ? SizedBox(
                  height: 12.h,
                  width: 12.w,
                )
              : Container(),
          Expanded(
            child: TextField(
              keyboardType: _keyboardType,
              controller: controller,
              onChanged: onChange,
              decoration: InputDecoration(
                isCollapsed: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 12.w),
                hintText: _hintText,
              ),
              obscureText: _obscureText,
            ),
          ),
          suffix != null
              ? SizedBox(
                  height: 12.h,
                  width: 12.w,
                )
              : Container(),
          suffix != null ? suffix! : Container(),
          SizedBox(
            height: 12.h,
            width: 12.w,
          )
        ],
      ),
    );
  }
}
