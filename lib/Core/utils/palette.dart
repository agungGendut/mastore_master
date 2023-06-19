import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFontWeight {
  static FontWeight thin = FontWeight.w100;
  static FontWeight extraLight = FontWeight.w200;
  static FontWeight light = FontWeight.w300;
  static FontWeight regular = FontWeight.w400;
  static FontWeight medium = FontWeight.w500;
  static FontWeight semiBold = FontWeight.w600;
  static FontWeight bold = FontWeight.w700;
  static FontWeight extraBold = FontWeight.w800;
  static FontWeight black = FontWeight.w900;
}

class Palette {
  static Color error = Color(0xffe30018);

  static Color primary1 = Color(0xff89bfe2);
  static Color primary2 = Color(0xfffac7b8);  
  static Color primary3 = Color(0xff4e5791);
  static Color primary4 = Color(0xfffaf3e6);

  static const Color textWhite   = const Color(0xFFF1F1F1);
  static const Color textGrey    = const Color(0xFFF1F1F1);
  static const Color textGrey2   = const Color(0xFFC6C6C8);
  static const Color textGrey3   = const Color(0xFF898989);

  static const Color divider     = const Color(0xFFEDEDED);

  static Color bgcolor = Color(0xffedf9fc);
  static Color bgcolorWhite = Color(0xffffffff);
  static Color bgcolorfield = Color(0xffF7F8F9);
  static Color bgcolorcontent = Color(0xffF6F8FC);

  static List<Color> kitGradients = [Color(0xFF3867D5), Color(0xFF81C7F5)];

  static var bordercolor = Color(0xffC5CCD8);

  static var denomNoActive = Color(0xffD4D4D4);

  // static var textColor = Color(0xff424242);
  static var textColor = Color(0xff000000);

  static var bglabelmoney = Color(0xffFAB495);

  static var shadowbox = Color(0xffF1F4F9);

  static var loadingcolor = Color(0xff212121);

  static Color hijau = Color(0xff74C69A);
  static Color oren = Color(0xffFEBB19);
  static Color biruMuda = Color(0xff5965AE);
  static Color biruTua = Color(0xff2A4094);
  static Color merah = Color(0xFFF21439);

  static const Color buttonGradientStart  = const Color(0xFF7EB6FF);
  static const Color buttonGradientEnd    = const Color(0xFF5F87E7);
  static const Color buttonShadow         = const Color(0xFF6894EE);

  static const Color fabGradientStart  = const Color(0xFFF857C3);
  static const Color fabGradientEnd    = const Color(0xFFE0139C);
  static const Color fabShadow         = const Color(0x78F456C3);

  static const Color redGradientStart  = const Color(0xFFE0139C);
  static const Color redGradientEnd    = const Color(0xFFD10263);
  static const Color redGradientShadow = const Color(0x45D10202);

  static const Color yellowGradientStart  = const Color(0xFFFFB100);
  static const Color yellowGradientEnd    = const Color(0xFFD89F20);
  static const Color yellowGradientShadow = const Color(0x26BAAE6E);

  static const mdlBasicWhite = Color(0x0ffFFFFFF);

  static const mdlSpaceCadet100 = Color(0x0ff1F2855);
  static const mdlSpaceCadet80 = Color(0x0ff4D5377);
  static const mdlSpaceCadet60 = Color(0x0ff797F99);
  static const mdlSpaceCadet40 = Color(0x0ffA6A9BC);
  static const mdlSpaceCadet20 = Color(0x0ffD1D4DD);

  static const mdlPowderBlue100 = Color(0x0ffA8DADB);
  static const mdlPowderBlue80 = Color(0x0ffB9E1E1);
  static const mdlPowderBlue60 = Color(0x0ffCBE9E9);
  static const mdlPowderBlue40 = Color(0x0ffDCF0F1);
  static const mdlPowderBlue20 = Color(0x0ffEEF8F9);

  static const mdlVerindianGreen100 = Color(0x0ff0093AD);
  static const mdlVerindianGreen80 = Color(0x0ff32A9BD);
  static const mdlVerindianGreen60 = Color(0x0ff67BECF);
  static const mdlVerindianGreen40 = Color(0x0ff9AD4DF);
  static const mdlVerindianGreen20 = Color(0x0ffCCE9EF);

  static const mdlEnglishVermilion100 = Color(0x0ffDA4A4A);
  static const mdlEnglishVermilion80 = Color(0x0ffE16D6E);
  static const mdlEnglishVermilion60 = Color(0x0ffEA9291);
  static const mdlEnglishVermilion40 = Color(0x0ffF1B7B6);
  static const mdlEnglishVermilion20 = Color(0x0ffF9DBDB);
  static const mdlEnglishVermilion10 = Color(0x0ffFCEEEE);

  static const mdlCutured20 = Color(0x0ffFCFCFC);
  static const mdlCutured40 = Color(0x0ffF9F9F9);
  static const mdlCutured60 = Color(0x0ffF5F5F5);
  static const mdlCutured80 = Color(0x0ffF2F2F2);
  static const mdlCutured100 = Color(0x0ffE7EAF1);

  static const primaryGradient = const LinearGradient(
    colors: const [Colors.blue, Colors.blue],
    stops: const [0.0, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const buttonGradient = const LinearGradient(
    colors: const [Colors.blue, Colors.blue],
    stops: const [0.0, 1.0],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const fabGradient = const LinearGradient(
    colors: const [fabGradientStart, fabGradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const redGradient = const LinearGradient(
    colors: const [redGradientStart, redGradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const yellowGradient = const LinearGradient(
    colors: const [yellowGradientStart, yellowGradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static TextStyle get mdlHeading1 => GoogleFonts.montserrat(
    fontWeight: AppFontWeight.bold,
    fontSize: 20,
    color: mdlSpaceCadet100,
    height: 28,
  );

  static TextStyle get mdlHeading2 => GoogleFonts.montserrat(
    fontWeight: AppFontWeight.semiBold,
    fontSize: 18,
    color: mdlSpaceCadet100,
    height: 24,
  );

  static TextStyle get mdlHeading2NoHeight => GoogleFonts.montserrat(
    fontWeight: AppFontWeight.semiBold,
    fontSize: 18,
    color: mdlSpaceCadet100,
    // height: 24,
  );

  static TextStyle get mdlHeading3 => GoogleFonts.montserrat(
    fontWeight: AppFontWeight.semiBold,
    fontSize: 16,
    color: mdlSpaceCadet100,
    height: 24,
  );

  static TextStyle get mdlHeading3NoHeight => GoogleFonts.montserrat(
    fontWeight: AppFontWeight.semiBold,
    fontSize: 16,
    color: mdlSpaceCadet100,
    // height: 24,
  );

  static TextStyle get mdlHeading4 => GoogleFonts.montserrat(
    fontWeight: AppFontWeight.semiBold,
    fontSize: 14,
    color: mdlSpaceCadet100,
    height: 20,
  );

  static TextStyle get mdlHeading5 => GoogleFonts.montserrat(
    fontWeight: AppFontWeight.semiBold,
    fontSize: 12,
    color: mdlSpaceCadet100,
    height: 20,
  );

  static TextStyle get mdlBodyMedium => GoogleFonts.montserrat(
    fontWeight: AppFontWeight.medium,
    fontSize: 14,
    color: mdlSpaceCadet100,
    height: 20,
  );

  static TextStyle get mdlBodyMediumNoHeight => GoogleFonts.montserrat(
    fontWeight: AppFontWeight.medium,
    fontSize: 14,
    color: mdlSpaceCadet100,
    // height: 20,
  );

  static TextStyle get mdlBodyRegular => GoogleFonts.montserrat(
    fontWeight: AppFontWeight.regular,
    fontSize: 14,
    color: mdlSpaceCadet100,
    height: 20,
  );

  static TextStyle get mdlBodySmall => GoogleFonts.montserrat(
    fontWeight: AppFontWeight.regular,
    fontSize: 12,
    color: mdlSpaceCadet100,
    height: 20,
  );

  static TextStyle get mdlBodySmallWhite => GoogleFonts.montserrat(
    fontWeight: AppFontWeight.regular,
    fontSize: 12,
    color: Colors.white,
    height: 20,
  );

  static TextStyle get mdlCaption => GoogleFonts.montserrat(
    fontWeight: AppFontWeight.regular,
    fontSize: 12,
    color: mdlSpaceCadet100,
    height: 18,
  );

  static TextStyle get mdlCaptionExtraLarge => GoogleFonts.montserrat(
    fontWeight: AppFontWeight.semiBold,
    fontSize: 14,
    color: mdlSpaceCadet100,
    height: 21,
  );

  static TextStyle get mdlCaptionLarge => GoogleFonts.montserrat(
    fontWeight: AppFontWeight.medium,
    fontSize: 13,
    color: mdlSpaceCadet100,
    height: 18,
  );

  static TextStyle get mdlCaptionLargeRed => GoogleFonts.montserrat(
    fontWeight: AppFontWeight.medium,
    fontSize: 13,
    color: mdlSpaceCadet100,
    // height: 18,
  );

  static TextStyle get mdlCaptionLargeWhite => GoogleFonts.montserrat(
    fontWeight: AppFontWeight.medium,
    fontSize: 13,
    color: Colors.white,
    // height: 18,
  );

  static TextStyle get mdlCaptionMedium => GoogleFonts.montserrat(
    fontWeight: AppFontWeight.medium,
    fontSize: 12,
    color: mdlSpaceCadet100,
    height: 18,
  );

  static TextStyle get mdlCaptionSmall => GoogleFonts.montserrat(
    fontWeight: AppFontWeight.medium,
    fontSize: 11,
    color: mdlSpaceCadet100,
    height: 16,
  );

  static TextStyle get mdlCaptionExtraSmall => GoogleFonts.montserrat(
    fontWeight: AppFontWeight.regular,
    fontSize: 10,
    color: mdlSpaceCadet100,
    height: 16,
  );

  static TextStyle get mdlLabel => GoogleFonts.montserrat(
    fontWeight: AppFontWeight.regular,
    fontSize: 12,
    color: mdlSpaceCadet100,
    height: 18,
  );

}
