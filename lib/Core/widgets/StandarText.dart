import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/palette.dart';

class StandarText {
  static header1(judul, fontsize) {
    return Text(
      '$judul',
      style: TextStyle(
        fontSize: fontsize,
        fontFamily: font,
        fontWeight: FontWeight.bold,
        color: Palette.textColor,
      ),
    );
  }

  static header2(judul, fontsize) {
    return Text(
      '$judul',
      textAlign: TextAlign.left,
      style: TextStyle(
          fontSize: fontsize,
          fontFamily: font,
          fontWeight: FontWeight.bold,
          color: Colors.white),
    );
  }

  static label(judul, fontsize, [Color? color]) {
    return Text(
      '$judul',
      textAlign: TextAlign.left,
      softWrap: true,
      style: TextStyle(
          fontSize: fontsize,
          fontFamily: font,
          fontWeight: FontWeight.bold,
          color: color ?? Palette.textColor),
    );
  }

  static labelCustom(judul, fontsize, maxline,
      {Color? color, FontWeight? fontWeight, TextAlign? textAlign}) {
    return Text(
      '$judul',
      textAlign: textAlign ?? TextAlign.left,
      softWrap: true,
      maxLines: maxline,
      style: TextStyle(
          fontSize: fontsize,
          fontFamily: font,
          fontWeight: fontWeight ?? FontWeight.normal,
          color: color ?? Palette.textColor),
    );
  }

  static labelRight(judul, fontsize, [Color? color]) {
    return Text(
      '$judul',
      textAlign: TextAlign.right,
      softWrap: true,
      style: TextStyle(
          fontSize: fontsize,
          fontFamily: font,
          fontWeight: FontWeight.bold,
          color: color ?? Palette.textColor),
    );
  }

  static labelCenter(judul, fontsize, [Color? color]) {
    return Text(
      '$judul',
      textAlign: TextAlign.center,
      softWrap: true,
      style: TextStyle(
          fontSize: fontsize,
          fontFamily: font,
          fontWeight: FontWeight.bold,
          color: color ?? Palette.textColor),
    );
  }

  static labelputih(judul, fontsize) {
    return Text(
      '$judul',
      textAlign: TextAlign.left,
      softWrap: true,
      style: TextStyle(
          fontSize: fontsize,
          fontFamily: font,
          fontWeight: FontWeight.bold,
          color: Colors.white),
    );
  }

  static redlabel(judul, fontsize) {
    return Text(
      '$judul',
      textAlign: TextAlign.center,
      softWrap: true,
      style: TextStyle(
          fontSize: fontsize,
          fontFamily: font,
          fontWeight: FontWeight.bold,
          color: Colors.red),
    );
  }

  static greenlabel(judul, fontsize) {
    return Text(
      '$judul',
      textAlign: TextAlign.center,
      softWrap: true,
      style: TextStyle(
          fontSize: fontsize,
          fontFamily: font,
          fontWeight: FontWeight.bold,
          color: Colors.green),
    );
  }

  static subtitle(judul, fontsize, [Color? color]) {
    return Text(
      '$judul',
      textAlign: TextAlign.center,
      softWrap: true,
      style: TextStyle(
        fontSize: fontsize,
        fontFamily: font,
//          fontWeight: FontWeight.bold,
        color: color ?? Colors.grey,
      ),
    );
  }

  static Widget labelBottomNav(String namaBottomNav, double textSize) {
    return Text(
      '$namaBottomNav',
      textAlign: TextAlign.center,
      softWrap: true,
      style: TextStyle(
        fontSize: textSize,
        fontFamily: font,
        fontWeight: FontWeight.bold,
        color: Palette.primary2,
        fontStyle: FontStyle.normal,
      ),
    );
  }

  static denomtext(String nominal, double textSize) {
    return Text(
      '$nominal',
      textAlign: TextAlign.center,
      softWrap: true,
      style: TextStyle(
        fontSize: textSize,
        fontFamily: font,
        fontWeight: FontWeight.bold,
        color: Palette.denomNoActive,
        fontStyle: FontStyle.normal,
      ),
    );
  }

  static labelfordetail(String s, double textSize) {
    return Text(
      '$s',
      textAlign: TextAlign.left,
      softWrap: true,
      style: TextStyle(
        fontSize: textSize,
        fontFamily: font,
        color: Palette.textColor,
        fontStyle: FontStyle.normal,
      ),
    );
  }

  static labelgrey(String s, double textSize) {
    return Text(
      '$s',
      textAlign: TextAlign.left,
      softWrap: true,
      style: TextStyle(
        fontSize: textSize,
        fontFamily: font,
        color: Palette.textGrey3,
        fontStyle: FontStyle.normal,
      ),
    );
  }

  static headermerah(String s, double textSize) {
    return Text(
      '$s',
      textAlign: TextAlign.left,
      softWrap: true,
      style: TextStyle(
          fontSize: textSize,
          fontFamily: font,
          color: Palette.primary2,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold),
    );
  }

  static suksesmessage(String strmessage, double textSize) {
    return Text(
      '$strmessage',
      textAlign: TextAlign.center,
      softWrap: true,
      style: TextStyle(
          fontSize: textSize,
          fontFamily: font,
          color: Palette.primary1,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold),
    );
  }

  static labeltopup(String strmessage, double textSize) {
    return Text(
      '$strmessage',
      textAlign: TextAlign.center,
      softWrap: true,
      style: TextStyle(
          fontSize: textSize,
          fontFamily: font,
          color: Colors.lightGreenAccent,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal),
    );
  }

  static headerCenter(judul, fontsize) {
    return Text(
      '$judul',
      style: TextStyle(
        fontSize: fontsize,
        fontFamily: font,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
      softWrap: true,
    );
  }
}
