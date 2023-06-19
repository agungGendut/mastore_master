import 'package:flutter/material.dart';
import 'package:mastore/Core/helpers/flutter_screen_scaler.dart';

import 'StandarText.dart';

class CardListWidget extends StatelessWidget{
  final BuildContext? context;
  final ScreenScaler? scaler;
  final String? image;
  final String? prdName;
  final String? prdDesc;
  final String? prdPrice;
  const CardListWidget({super.key, this.context, this.scaler, this.image, this.prdName, this.prdDesc, this.prdPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: scaler?.getHeight(15),
        width: scaler?.getWidth(20),
        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Container(
              height: 90,
              width: 180,
              margin: const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  image ?? "",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              // height: scaler.getHeight(10),
              width: scaler?.getWidth(50),
              margin: scaler?.getMarginLTRB(1, 0, 1, 0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StandarText.labelCustom(prdName, 12.0, 3,
                      color: Colors.black, textAlign: TextAlign.center),
                  const Divider(thickness: 2,),
                  StandarText.labelCustom(prdDesc, 12.0, 3,
                      color: Colors.black, fontWeight: FontWeight.normal, textAlign: TextAlign.center),
                  StandarText.labelCustom("Rp. $prdPrice", 12.0, 3,
                      color: Colors.black, textAlign: TextAlign.center),
                ],
              ),
            )
          ],
        )
    );
  }
}