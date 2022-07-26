import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallButton extends StatelessWidget {
  const SmallButton({
    Key? key,
    this.buttonText,
    this.press,
    required this.color,
    required this.textColor,
  }) : super(key: key);
  final String? buttonText;
  final Function()? press;
  final Color color, textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.35,
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(9.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 10,
              offset: const Offset(0, 3),
            )
          ]),
      child: Center(
        child: GestureDetector(
          onTap: press,
          child: Text(
            buttonText!,
            textAlign: TextAlign.left,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: textColor,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
