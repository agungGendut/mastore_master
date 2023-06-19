import 'package:flutter/material.dart';

import '../helpers/flutter_screen_scaler.dart';
import '../utils/palette.dart';
import 'StandarText.dart';
import 'button_color.dart';

void alertDialog(
    {required BuildContext context,
    required ScreenScaler scaler,
    String? msg,
    Widget? body,
    String? title,
    Color? color,
    Color? textColor,
    double? height,
    List<Widget>? actions,
    GestureTapCallback? onPressed}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        // title: title!=null? Text(title, style: TextStyle(color: color??Colors.red, fontSize: scaler.getTextSize(12)), textAlign: TextAlign.center,) : null,
        contentPadding: scaler.getPaddingLTRB(2, 0.5, 2, 0.5),
        content: body ??
            Container(
              height: height ?? scaler.getHeight(25),
              width: scaler.getWidth(100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  title != null
                      ? StandarText.labelCustom(title, scaler.getTextSize(11), 2,
                          textAlign: TextAlign.center, color: color)
                      : Container(),
                  title != null
                      ? SizedBox(
                          height: 10,
                        )
                      : Container(),
                  StandarText.labelCustom(msg ?? "", scaler.getTextSize(11), 2,
                      fontWeight: FontWeight.normal,
                      color: textColor ?? Colors.black,
                      textAlign: TextAlign.center),
                  Container(
                    width: scaler.getWidth(100),
                    margin: scaler.getMarginLTRB(0, 1, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: actions ??
                          [
                            ButtonColor(
                                height: scaler.getWidth(7),
                                scaler: scaler,
                                text: "Oke",
                                margin: scaler.getMarginLTRB(0, 1, 0, 0),
                                btnColor: Palette.primary1,
                                textColor: Colors.white,
                                onPressed:
                                    onPressed ?? () => Navigator.pop(context))
                          ],
                    ),
                  )
                ],
              ),
            ),
      );
    },
  );
}
