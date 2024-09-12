import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../main.dart';

class AppTheme {
  static TextStyle info = GoogleFonts.patuaOne(
    decoration: TextDecoration.none,
    color: Colors.black,
    fontSize: isIpad
        ? 20
        : isSmallDevice
            ? 18
            : 24,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.1,
  );

  static TextStyle info1 = GoogleFonts.patuaOne(
    decoration: TextDecoration.none,
    color: Colors.white,
    fontSize: isIpad
        ? 30
        : isSmallDevice
            ? 28
            : 20,
    // fontWeight: FontWeight.bold,
    letterSpacing: 1.1,
  );
  static TextStyle whiteBig = GoogleFonts.playfairDisplaySc(
    decoration: TextDecoration.none,
    color: Colors.white,
    fontSize: isIpad
        ? 30
        : isSmallDevice
            ? 22
            : 28,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.1,
  );

// Text NaME style
  static final TextStyle name1 = GoogleFonts.patuaOne(
    decoration: TextDecoration.none,
    fontSize: isIpad
        ? 30
        : isSmallDevice
            ? 18
            : 24,
    fontWeight: FontWeight.w300,
    color: Colors.grey,
    letterSpacing: 1,
  );

// info details style
  static final TextStyle details = GoogleFonts.patuaOne(
    decoration: TextDecoration.none,
    fontSize: isIpad
        ? 32
        : isSmallDevice
            ? 18
            : 22,
    // fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static TextStyle greenText = GoogleFonts.playfairDisplaySc(
    decoration: TextDecoration.none,
    fontSize: isIpad
        ? 30
        : isSmallDevice
            ? 24
            : 22,
    // fontWeight: FontWeight.bold,
    color: const Color(0xff0CAC6C),
    // letterSpacing: 1,
  );
  static TextStyle seeMore = GoogleFonts.patuaOne(
    decoration: TextDecoration.none,
    color: Colors.white,
    fontSize: isIpad
        ? 30
        : isSmallDevice
            ? 12
            : 16,
    // fontWeight: FontWeight.w600,
  );

  static Color background = const Color(0xff2A252B);
  static Color appBar = const Color(0xff27262B);
  static Color cont = const Color(0xff393939);
  static Color cont1 = const Color(0xffBEBEBE);
  static Color cont2 = const Color(0xff746F75);
}
