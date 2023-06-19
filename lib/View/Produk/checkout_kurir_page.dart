import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastore/Bloc/Profile_bloc/profile_bloc.dart';
import 'package:mastore/Bloc/transaksi_bloc/transaksi_bloc.dart';
import 'package:mastore/Core/widgets/loading_page.dart';
import 'package:mastore/Model/ekspedisi_model.dart';

import '../../Core/helpers/flutter_screen_scaler.dart';
import '../../Core/widgets/StandarText.dart';
import '../../Model/add_to_cart_model.dart';
import '../../Model/userLogin_wrapper.dart';

class CheckOutKurirPage extends StatefulWidget{
  final String? idPenjual;
  const CheckOutKurirPage({super.key, this.idPenjual});

  @override
  State<CheckOutKurirPage> createState() => CheckOutKurirPageState();
}

class CheckOutKurirPageState extends State<CheckOutKurirPage>{
  UserLoginWrapper? userLogindata;
  List<ListKurir>? kurirList;
  List<JasaPengiriman>? jasaKirim;
  List<ChartProductData>? produkData;
  String? dropKurir = "";
  String? dropJasa = "";
  String? dropIdKurir = "";
  String? dropLayanan = "";
  String? dropOngkir = "";
  String? idPembeli = "";
  String? idPenjual = "";
  int? isSelected;

  @override
  void initState() {
    dropKurir = "";
    dropJasa = "";
    idPembeli = "";
    idPenjual = "";
    dropIdKurir = "";
    dropLayanan = "";
    dropOngkir = "";
    context.read<ProfileBloc>().add(GetProfileKurir(widget.idPenjual ?? ""));
    super.initState();
  }

  Future<bool> onWillPop() async {
    Navigator.pushNamed(context, "checkoutPage");

    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state){
            if (state is UserProfileGetData) {
              userLogindata = state.userLoginData;
            }
          },
          builder: (context, state){
            if (state is KurirGetData){
              kurirList = state.kurirList;
              jasaKirim = state.jenisJasa;
              return BlocBuilder<TransaksiBloc, TransaksiState>(
                  builder: (context, stateTrans){
                    if (stateTrans is TransaksiBerhasilDitambah){
                      for (var element in stateTrans.chartProduk) {
                        idPenjual = element.prdOwnId.toString();
                        idPembeli = element.pembeliId.toString();
                        produkData = element.chartData;
                      }
                      return CustomScrollView(
                        slivers: [
                          SliverAppBar(
                            backgroundColor: Colors.white,
                            leading: GestureDetector(
                              onTap: () => onWillPop(),
                              child: const Icon(Icons.arrow_back_ios_new, color: Colors.black,),
                            ),
                            title: StandarText.header1("Jasa Pengiriman", 20.0),
                          ),

                          SliverToBoxAdapter(
                            child: Container(
                              margin: const EdgeInsets.only(left: 20, top: 15, right: 20),
                              child: Column(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        child: StandarText.labelCustom("Pilih Kurir", 14.0, 2, color: Colors.black, fontWeight: FontWeight.normal),
                                      ),
                                      SizedBox(
                                        height: 60,
                                        width: scaler.getWidth(100),
                                        child: DropdownButton<String>(
                                            hint: dropKurir?.isNotEmpty == true ?StandarText.labelCustom(dropKurir, 14.0, 1): StandarText.labelCustom(kurirList?[0].kurirName, 14.0, 1),
                                            value: null,
                                            icon: const Icon(Icons.keyboard_arrow_down_outlined),
                                            elevation: 16,
                                            isExpanded: true,
                                            underline: Container(
                                              height: 2,
                                              color: Colors.black26,
                                            ),
                                            style: const TextStyle(color: Colors.black87),
                                            items: kurirList?.map((val) {
                                              return DropdownMenuItem<String>(
                                                value: val.kurirKode,
                                                child: Text(val.kurirName ?? ""),
                                              );
                                            }).toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                dropKurir = value?.toUpperCase();
                                                // dropIdKurir = kurirList?.where((element) => element.kurirKode == value);
                                                kurirList?.where((element) => element.kurirKode == value).forEach((element) {
                                                  dropIdKurir = element.kurirName;
                                                });
                                                print("data kurir $dropIdKurir");
                                                context.read<ProfileBloc>().add(GetProfileJasaKurir(
                                                    stateTrans.idKabupaten ?? "",
                                                    userLogindata?.data?.idKecamatan ?? "",
                                                    value ?? "",
                                                    stateTrans.beratBarang ?? ""
                                                ));
                                              });
                                            }
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        child: StandarText.labelCustom("Pilih Layanan", 14.0, 2, color: Colors.black, fontWeight: FontWeight.normal),
                                      ),
                                      Column(
                                        children: List.generate(jasaKirim?.length ?? 0,
                                                (index) {
                                          return GestureDetector(
                                            onTap: (){
                                              setState(() {
                                                isSelected = index;
                                                dropJasa = jasaKirim?[index].layananId;
                                                dropLayanan = jasaKirim?[index].layananId;
                                                dropOngkir = jasaKirim?[index].layananHarga;
                                              });
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.only(top: 15),
                                              decoration: BoxDecoration(
                                                color: isSelected == index ? Colors.grey: Colors.transparent
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  StandarText.labelCustom("${jasaKirim?[index].layananId} - ${jasaKirim?[index].layananName}", 17.0, 1),
                                                  Row(
                                                    children: [
                                                      StandarText.labelCustom("Rp. ${jasaKirim?[index].layananHarga}", 14.0, 1, color: Colors.red),
                                                      StandarText.labelCustom(" / Pengiriman: ${jasaKirim?[index].layananHari}", 14.0, 1, color: Colors.black),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                                }),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    
                    return const LoadingPage();
                  }
              );
            }

            return const LoadingPage();
          },
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: GestureDetector(
            onTap: (){
              print("id penjual $idPenjual");
              print("id pembeli $idPembeli");
              context.read<TransaksiBloc>().add(TransaksiPembayaran(
                  idPembeli ?? "",
                  idPenjual ?? "",
                  dropKurir?.toLowerCase() ?? "",
                  dropIdKurir ?? "",
                  dropLayanan ?? "",
                  dropOngkir ?? "",
                  produkData));
              //Navigator.pushNamed(context, "checkoutKurir", arguments: widget.idPenjual);
            },
            child: Container(
              height: 50,
              width: scaler.getWidth(30),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.deepOrangeAccent
              ),
              child: StandarText.labelCustom("Lanjut Pembayaran", 14.0, 2,color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}