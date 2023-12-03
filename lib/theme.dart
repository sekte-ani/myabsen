import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color greenColor = const Color(0xff63BE41);
Color green2Color = const Color(0xff459D25);
Color subtleGreenColor = const Color(0xff82CB67);
Color darkGreenColor = const Color(0xff031F10);
Color redColor = const Color(0xffFB4141);

Color blackColor = const Color(0xff404040);
Color greyColor = const Color(0xffC7C9D9);
Color darkGreyColor = const Color(0xffA3A3A3);
Color lightGreyColor = const Color(0xffEDEFF9);
Color bgColor = const Color(0xffF6F9FF);
Color whiteColor = const Color(0xffFFFFFF);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w700;
FontWeight bold = FontWeight.w800;
FontWeight extraBold = FontWeight.w900;

BoxShadow themeShadow = BoxShadow(
  color: darkGreyColor.withOpacity(0.2),
  blurRadius: 10.0,
  spreadRadius: 0,
);

TextStyle font_light = GoogleFonts.montserrat(
  fontWeight: light,
  color: blackColor,
);
TextStyle font_regular = GoogleFonts.montserrat(
  fontWeight: regular,
  color: blackColor,
);
TextStyle font_medium = GoogleFonts.montserrat(
  fontWeight: medium,
  color: blackColor,
);
TextStyle font_semiBold = GoogleFonts.montserrat(
  fontWeight: semiBold,
  color: blackColor,
);
TextStyle font_bold = GoogleFonts.montserrat(
  fontWeight: bold,
  color: blackColor,
);
TextStyle font_extraBold = GoogleFonts.montserrat(
  fontWeight: extraBold,
  color: blackColor,
);
