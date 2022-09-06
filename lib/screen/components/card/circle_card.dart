import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CircleMonitorUp extends StatelessWidget {
  const CircleMonitorUp({
    Key? key,
    required this.circleColor,
    required this.img,
    required this.txt,
    required this.numberColor,
    this.onTap,
  }) : super(key: key);
  final Color circleColor, numberColor;
  final String img, txt;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    blurRadius: 0,
                    color: Colors.grey.withOpacity(0.8),
                    spreadRadius: 1)
              ],
            ),
            child: CircleAvatar(
              radius: 51.w,
              backgroundColor: circleColor,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(img, height: 40.w),
                    SizedBox(
                      height: 3.w,
                    ),
                    Text(
                      txt,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: numberColor,
                          fontSize: 14.w,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CircleMonitorDown extends StatelessWidget {
  const CircleMonitorDown(
      {Key? key,
      required this.circleColor,
      required this.numberColor,
      required this.img,
      required this.txt})
      : super(key: key);
  final Color circleColor, numberColor;
  final String img, txt;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  blurRadius: 0,
                  color: Colors.grey.withOpacity(0.8),
                  spreadRadius: 1)
            ],
          ),
          child: CircleAvatar(
            radius: 51.w,
            backgroundColor: circleColor,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(img, height: 45.w),
                  Text(
                    txt,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: numberColor,
                        fontSize: 14.w,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
