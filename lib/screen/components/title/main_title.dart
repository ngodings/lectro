import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({Key? key, required this.title, required this.color})
      : super(key: key);
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(
          color: color,
          fontSize: 15.w,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
