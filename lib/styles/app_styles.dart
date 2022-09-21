import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color primaryColor = const Color(0xFFF8EEE2);
  static Color h1Color = const Color(0xFF403B36);
  static Color h2Color = const Color(0xFF595550);
  static Color textColor = const Color(0xFF403B36);

  static TextStyle appBarTitle = GoogleFonts.poppins(
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    color: h1Color,
  );

  static TextStyle appBarTitleText = GoogleFonts.poppins(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: const Color(0xFF1F5753),
  );

  static TextStyle h1Text = GoogleFonts.poppins(
    fontSize: 13.0,
    fontWeight: FontWeight.w500,
    color: textColor,
    wordSpacing: 1.5,
  );

  static TextStyle h2Text = GoogleFonts.poppins(
    fontSize: 14.0,
    color: textColor,
  );

  static TextStyle buttonText = GoogleFonts.poppins(
    fontSize: 14.0,
    color: Colors.white,
  );
}
