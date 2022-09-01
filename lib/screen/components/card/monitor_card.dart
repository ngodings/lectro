import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/theme_data.dart';

class MonitorCard extends StatelessWidget {
  const MonitorCard(
      {Key? key, required this.title, required this.value, required this.txt})
      : super(key: key);
  final String title, value, txt;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(15.w),
        child: Container(
          width: constraint.maxWidth / 2 - 10,
          decoration: BoxDecoration(
            color: CustomColor.primary,
            borderRadius: BorderRadius.all(Radius.circular(15.w)),
          ),
          height: 160.w,
          child: Card(
            shadowColor: CustomColor.onBackground,
            color: CustomColor.primary,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                15.w,
              ),
            ),
            child: Container(
              width: constraint.maxWidth / 2 - 10,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    blurStyle: BlurStyle.outer,
                    color: Colors.black26,
                    spreadRadius: 2.5,
                    blurRadius: 2.5,
                  )
                ],
                color: CustomColor.primary,
                border: Border.all(
                  color: Colors.white70,
                  width: 0.5,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.all(Radius.circular(15.w)),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 20.w,
                  bottom: 20.w,
                  left: 10.w,
                  right: 10.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: CustomColor.onPrimary,
                          fontSize: 13.w,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      value,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: CustomColor.onPrimary,
                          fontSize: 26.w,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Text(
                      txt,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: CustomColor.onPrimary,
                          fontSize: 16.w,
                          fontWeight: FontWeight.w600,
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
    });
  }
}
