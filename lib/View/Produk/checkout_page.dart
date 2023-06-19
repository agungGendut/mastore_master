import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastore/Bloc/Profile_bloc/profile_bloc.dart';
import 'package:mastore/Core/widgets/loading_page.dart';
import 'package:mastore/Model/userLogin_wrapper.dart';

import '../../Bloc/transaksi_bloc/transaksi_bloc.dart';
import '../../Core/helpers/flutter_screen_scaler.dart';
// import '../../Core/utils/constants.dart';
import '../../Core/widgets/StandarText.dart';
import '../../Core/widgets/snackBarCustom.dart';
import '../../Model/address_model.dart';
// import '../../Core/widgets/loading_page.dart';

class CheckoutPage extends StatefulWidget{
  final String? idPenjual;
  const CheckoutPage({super.key, this.idPenjual});

  @override
  State<CheckoutPage> createState() => CheckoutPageState();
}

class CheckoutPageState extends State<CheckoutPage>{
  TextEditingController namaPenerima = TextEditingController();
  TextEditingController telponPenerima = TextEditingController();
  TextEditingController alamatPenerima = TextEditingController();
  UserLoginWrapper? userLogindata;
  List<Province>? provinceList;
  List<Kabupaten>? kabupatenList;
  List<Kecamatan>? kecamatanList;
  String? dropProvince = "";
  String? dropKabupaten = "";
  String? dropKecamatan = "";
  String? alamatLengkap = "";

  @override
  void initState() {
    dropProvince = "";
    dropKabupaten = "";
    dropKecamatan = "";
    super.initState();
  }

  Future<bool> onWillPop() async {
    PopupCustom().warningCloseTransaksi(
        context, "Anda akan membatalkan transaksi ini?",
            () => Navigator.of(context).pushReplacementNamed("HomeScreen", arguments: "1"));

    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    return WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          body: BlocConsumer<ProfileBloc, ProfileState>(
            listener: (context, profState){
              if (profState is UserProfileGetData) {
                context.read<ProfileBloc>().add(GetProfileProvince());
                context.read<ProfileBloc>().add(GetProfileKabupaten(profState.userLoginData?.data?.idProv ?? ""));
                context.read<ProfileBloc>().add(GetProfileKecamatan(profState.userLoginData?.data?.idKota ?? ""));
              }
            },
            builder: (context, profState){
              if (profState is UserProfileGetData) userLogindata = profState.userLoginData;
              if (profState is AddressGetData) {
                provinceList = profState.provinceData;
                kabupatenList = profState.kabupatenData;
                kecamatanList = profState.kecamatanData;

                return BlocBuilder<TransaksiBloc, TransaksiState>(
                    builder: (context, state){
                      if (state is TransaksiBerhasilDitambah){
                        return CustomScrollView(
                          slivers: [
                            SliverAppBar(
                              backgroundColor: Colors.white,
                              leading: GestureDetector(
                                onTap: () => onWillPop(),
                                child: const Icon(Icons.arrow_back_ios_new, color: Colors.black,),
                              ),
                              title: StandarText.header1("Alamat", 20.0),
                            ),

                            SliverToBoxAdapter(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                margin: const EdgeInsets.only(left: 20, right: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          child: StandarText.labelCustom("Nama Penerima", 14.0, 2, color: Colors.black, fontWeight: FontWeight.normal),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(left: 0, top: 5, right: 0, bottom: 5),
                                          child: TextField(
                                            controller: namaPenerima,
                                            decoration: InputDecoration(
                                              hintText: userLogindata?.data?.username,
                                            ),
                                            onSubmitted: (val){
                                              print(val);
                                              if (val.isEmpty) {
                                                namaPenerima.clear();
                                                context.read<TransaksiBloc>().add(GetNamaPembeli(userLogindata?.data?.username ?? ""));
                                              } else {
                                                context.read<TransaksiBloc>().add(GetNamaPembeli(val));
                                              }
                                            },
                                            onChanged: (val){
                                              print(val);
                                              if (val.isEmpty) {
                                                namaPenerima.clear();
                                                context.read<TransaksiBloc>().add(GetNamaPembeli(userLogindata?.data?.username ?? ""));
                                              } else {
                                                context.read<TransaksiBloc>().add(GetNamaPembeli(val));
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          child: StandarText.labelCustom("No Handphone/Whatsapp ", 14.0, 1, color: Colors.black, fontWeight: FontWeight.normal),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(left: 0, top: 5, right: 0, bottom: 5),
                                          child: TextField(
                                            controller: telponPenerima,
                                            decoration: InputDecoration(
                                              hintText: userLogindata?.data?.handphone,
                                            ),
                                            onSubmitted: (val){
                                              print(val);
                                              if (val.isEmpty) {
                                                telponPenerima.clear();
                                                context.read<TransaksiBloc>().add(GetPhonePembeli(userLogindata?.data?.handphone ?? ""));
                                              } else {
                                                context.read<TransaksiBloc>().add(GetPhonePembeli(val));
                                              }
                                            },
                                            onChanged: (val){
                                              print(val);
                                              if (val.isEmpty) {
                                                telponPenerima.clear();
                                                context.read<TransaksiBloc>().add(GetPhonePembeli(userLogindata?.data?.handphone ?? ""));
                                              } else {
                                                context.read<TransaksiBloc>().add(GetPhonePembeli(val));
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          child: StandarText.labelCustom("Alamat Lengkap", 14.0, 2, color: Colors.black, fontWeight: FontWeight.normal),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(left: 0, top: 5, right: 0, bottom: 5),
                                          child: TextField(
                                            controller: alamatPenerima,
                                            decoration: InputDecoration(
                                              hintText: userLogindata?.data?.alamat,
                                            ),
                                            onSubmitted: (val){
                                              print(val);
                                              if (val.isEmpty) {
                                                alamatPenerima.clear();
                                                context.read<TransaksiBloc>().add(GetAlamatPembeli(userLogindata?.data?.alamat ?? ""));
                                              } else {
                                                context.read<TransaksiBloc>().add(GetAlamatPembeli(val));
                                              }
                                            },
                                            onChanged: (val){
                                              print(val);
                                              if (val.isEmpty) {
                                                alamatPenerima.clear();
                                                context.read<TransaksiBloc>().add(GetAlamatPembeli(userLogindata?.data?.alamat ?? ""));
                                              } else {
                                                context.read<TransaksiBloc>().add(GetAlamatPembeli(val));
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          child: StandarText.labelCustom("Provinsi", 14.0, 2, color: Colors.black, fontWeight: FontWeight.normal),
                                        ),
                                        SizedBox(
                                          height: 60,
                                          width: scaler.getWidth(100),
                                          child: DropdownButton<String>(
                                              hint: StandarText.labelCustom(provinceList?.where((e) => e.idProv == userLogindata?.data?.idProv).first.provName, 18.0, 1),
                                              value: dropProvince?.isNotEmpty == true ? dropProvince : null,
                                              icon: const Icon(Icons.keyboard_arrow_down_outlined),
                                              elevation: 16,
                                              isExpanded: true,
                                              underline: Container(
                                                height: 2,
                                                color: Colors.black26,
                                              ),
                                              style: const TextStyle(color: Colors.black87),
                                              items: provinceList?.map((val) {
                                                return DropdownMenuItem<String>(
                                                  value: val.idProv,
                                                  child: Text(val.provName ?? ""),
                                                );
                                              }).toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  dropProvince = value;
                                                  //context.read<ProfileBloc>().add(GetProfileKabupaten(dropProvince ?? ""));
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
                                          child: StandarText.labelCustom("Kota / Kabupaten", 14.0, 2, color: Colors.black, fontWeight: FontWeight.normal),
                                        ),
                                        SizedBox(
                                          height: 60,
                                          width: scaler.getWidth(100),
                                          child: DropdownButton<String>(
                                              hint: StandarText.labelCustom(kabupatenList?.where((e) => e.kokabId == userLogindata?.data?.idKota).first.kokabName ?? "", 18.0, 1),
                                              value: dropKabupaten?.isNotEmpty == true ? dropKabupaten : null ,
                                              icon: const Icon(Icons.keyboard_arrow_down_outlined),
                                              elevation: 16,
                                              isExpanded: true,
                                              underline: Container(
                                                height: 2,
                                                color: Colors.black26,
                                              ),
                                              style: const TextStyle(color: Colors.black87),
                                              items: kabupatenList?.map((val) {
                                                return DropdownMenuItem<String>(
                                                  value: val.kokabId,
                                                  child: Text(val.kokabName ?? ""),
                                                );
                                              }).toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  dropKabupaten = value;
                                                  //context.read<ProfileBloc>().add(GetProfileKecamatan(dropKabupaten ?? ""));
                                                });
                                              }
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 10,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: scaler.getWidth(20),
                                          child: StandarText.labelCustom("Kecamatan", 14.0, 2, color: Colors.black, fontWeight: FontWeight.normal),
                                        ),
                                        SizedBox(
                                          height: 60,
                                          width: scaler.getWidth(100),
                                          child: DropdownButton<String>(
                                              hint: StandarText.labelCustom(kecamatanList?.where((e) => e.kecId == userLogindata?.data?.idKecamatan).first.kecName ?? "", 18.0, 1),
                                              value: dropKecamatan?.isNotEmpty == true ? dropKecamatan : null ,
                                              icon: const Icon(Icons.keyboard_arrow_down_outlined),
                                              elevation: 16,
                                              isExpanded: true,
                                              underline: Container(
                                                height: 2,
                                                color: Colors.black26,
                                              ),
                                              style: const TextStyle(color: Colors.black87),
                                              items: kecamatanList?.map((val) {
                                                return DropdownMenuItem<String>(
                                                  value: val.kecId,
                                                  child: Text(val.kecName ?? ""),
                                                );
                                              }).toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  dropKecamatan = value;
                                                  // context.read<ProfileBloc>().add(GetProfileKabupaten(dropProvince ?? ""));
                                                });
                                              }
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      return LoadingPage();
                    });
              }

              return const LoadingPage();
            },
          ),
          bottomNavigationBar: Container(
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: GestureDetector(
              onTap: (){
                var province;
                var kabupaten;
                var kecamatan;
                if (dropProvince == ""){
                  province = provinceList?.where((e) => e.idProv == userLogindata?.data?.idProv).first.provName ?? "";
                } else if (dropKabupaten == ""){
                  kabupaten = kabupatenList?.where((e) => e.kokabId == userLogindata?.data?.idKota).first.kokabName ?? "";
                } else if (dropKecamatan == ""){
                  kecamatan = kecamatanList?.where((e) => e.kecId == userLogindata?.data?.idKecamatan).first.kecName ?? "";
                }

                setState(() {
                  alamatLengkap = "${userLogindata?.data?.alamat}, $kecamatan, $kabupaten, $province";
                });

                context.read<TransaksiBloc>().add(GetAlamatPembeli(alamatLengkap ?? ""));
                context.read<ProfileBloc>().add(GetProfileUser());
                Navigator.pushNamed(context, "checkoutKurir", arguments: widget.idPenjual);
              },
              child: Container(
                height: 50,
                width: scaler.getWidth(30),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.deepOrangeAccent
                ),
                child: StandarText.labelCustom("Simpan Alamat", 14.0, 2,color: Colors.white),
              ),
            ),
          ),
        ));
  }
}