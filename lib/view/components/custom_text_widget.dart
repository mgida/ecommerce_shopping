import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextWidget extends StatelessWidget {
  final String title;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final TextDecoration decoration;

  CustomTextWidget(
      {required this.title,
      this.color = Colors.black,
      this.fontWeight = FontWeight.normal,
      this.fontSize = 15,
      this.decoration = TextDecoration.none});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.nunitoSans(
        textStyle: TextStyle(
            color: color,
            fontWeight: fontWeight,
            fontSize: fontSize,
            decoration: decoration),
      ),
    );
  }
}
