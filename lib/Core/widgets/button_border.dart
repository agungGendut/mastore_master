import 'package:flutter/material.dart';
import '../helpers/flutter_screen_scaler.dart';
import '../utils/constants.dart';
import 'StandarText.dart';


class ButtonBorder extends StatelessWidget {
  late ScreenScaler scaler;
  late GestureTapCallback onPressed;
  late String text;
  late IconData? icon;
  late Color? iconColor;
  late double? iconSize;
  late EdgeInsetsGeometry? margin;
  late double? width;
  late double? height;
  late Color? btnColor;
  late Color? textColor;
  late double? fontSize;
  late BorderRadiusGeometry? borderRadius;

  ButtonBorder(
      {required this.scaler,
      required this.text,
      required this.onPressed,
      this.icon,
      this.iconColor,
      this.iconSize,
      this.margin,
      this.width,
      this.height,
      this.btnColor,
      this.textColor,
      this.fontSize,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ??
          EdgeInsets.only(
            top: scaler.getHeight(5),
            bottom: scaler.getHeight(2),
          ),
      width: width ?? scaler.getWidth(21),
      height: height ?? scaler.getWidth(9),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: btnColor ?? Colors.black12, width: 2),
        borderRadius: borderRadius ?? BorderRadius.circular(10.0),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: icon != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: iconColor,
                      size: iconSize,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    StandarText.label(
                        text,
                        scaler.getTextSize(fontSize ?? fontsz),
                        textColor ?? Colors.black)
                  ],
                )
              : Center(
                  child: StandarText.label(
                      text,
                      scaler.getTextSize(fontSize ?? fontsz),
                      textColor ?? Colors.black),
                ),
        ),
      ),
    );
  }
}
