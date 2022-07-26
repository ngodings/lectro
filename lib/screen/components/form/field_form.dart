import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FieldViewable extends StatelessWidget {
  const FieldViewable({Key? key, required this.title, required this.field})
      : super(key: key);
  final String title, field;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.w, right: 15.w, left: 15.w, bottom: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.w),
            child: Text(
              title,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 16.w,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Container(
            height: 50.w,
            width: 330.w,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1,
              ),
              color: const Color(0xFF9793ad),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(9),
                  topRight: Radius.circular(9),
                  bottomLeft: Radius.circular(9),
                  bottomRight: Radius.circular(9)),
              boxShadow: [
                BoxShadow(
                    color: const Color(0xFF000000).withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                    blurStyle: BlurStyle.inner // changes position of shadow
                    ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, top: 9.w),
              child: Text(
                field,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 18.w,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
