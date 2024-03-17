import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultPadding = 20;
double defaultBorderRadius = 15;

String baseAPIURL() {
  return "https://pengaduan-masyarakat.byraq-tech.com/api";
}

Map<String, String> header(
  bool isNeedToken, {
  String? token,
}) {
  if (isNeedToken == true) {
    return {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  } else {
    return {
      'Accept': 'application/json',
    };
  }
}

double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

bool keyboardIsOpen(BuildContext context) {
  return MediaQuery.of(context).viewInsets.bottom != 0;
}

Color primaryColor = const Color(0xFFf59e0b);
Color secondaryColor = const Color(0xFF43afc8);
Color sionYellowColor = const Color(0xffFFD600);
Color tertiary500 = const Color(0xFF2632ff);
Color tertiary400 = const Color(0xFF6569ff);
Color tertiary300 = const Color(0xFF9597FF);
Color grey700 = const Color(0xFF111114);
Color grey600 = const Color(0xFF2b2b30);
Color grey500 = const Color(0xFF4b4b53);
Color grey400 = const Color(0xFF6d6d75);
Color black1 = const Color(0xFF18181b);
Color black2 = const Color(0xFF09090b);
Color white = const Color(0xFFFFFFFF);

BoxShadow primaryShadow = BoxShadow(
  blurRadius: 5,
  color: grey400.withOpacity(0.3),
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;

TextStyle primaryTextStyle = GoogleFonts.poppins(
  color: white,
  fontWeight: regular,
);

TextStyle secondaryTextStyle = GoogleFonts.poppins(
  color: black1,
  fontWeight: regular,
);

TextStyle eduPelitaTextStyle = GoogleFonts.comfortaa(
  color: black1,
  fontWeight: regular,
);
