import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastore/Bloc/transaksi_bloc/transaksi_bloc.dart';
import 'package:mastore/Core/widgets/StandarText.dart';

// import '../../View/Produk/chart_page.dart';
import '../utils/constants.dart';

class PopupCustom {

  void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void dialogOption(BuildContext context, String title) {
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: StandarText.labelCustom(title, 27.0, 1, fontWeight: FontWeight.w400),
            content: Container(
              height: 60,
              width: 180,
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StandarText.labelCustom("Ingin melihat isi keranjang?", 17.0, 1),
                  StandarText.labelCustom("Atau ingin tetap belanja?", 17.0, 1)
                ],
              ),
            ),
            actions: [
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, "HomeScreen", arguments: "1");
                },
                child: Container(
                  height: 30,
                  width: 180,
                  // decoration: BoxDecoration(
                  //     border: Border.all(color: Colors.green),
                  //     borderRadius: BorderRadius.circular(16),
                  //     color: Colors.green
                  // ),
                  child: const Text("Lihat Keranjang", style: TextStyle(color: Colors.black), textAlign: TextAlign.center,),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, "HomeScreen", arguments: "0");
                },
                child: Container(
                  height: 30,
                  width: 180,
                  // decoration: BoxDecoration(
                  //     border: Border.all(color: Colors.green),
                  //     borderRadius: BorderRadius.circular(16),
                  //     color: Colors.green
                  // ),
                  child: const Text("Lanjut Belanja", style: TextStyle(color: Colors.deepOrangeAccent), textAlign: TextAlign.center,),
                ),
              )
            ],
          );
        }
    );
  }

  void warningCloseTransaksi(BuildContext context, String desc, Function() onTap) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(desc),
            actions: [
              GestureDetector(
                onTap: onTap,
                child: Container(
                  height: 30,
                  width: 60,
                  margin: const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: const Text("Ok", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
                ),
              )
            ],
          );
        }
    );
  }
}