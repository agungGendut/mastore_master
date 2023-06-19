import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastore/Bloc/Produk_bloc/produk_bloc.dart';
import 'package:mastore/Bloc/Profile_bloc/profile_bloc.dart';
import 'package:mastore/Bloc/transaksi_bloc/transaksi_bloc.dart';
import 'package:mastore/Core/utils/constants.dart';
import 'package:mastore/Core/widgets/StandarText.dart';
import 'package:mastore/Core/widgets/snackBarCustom.dart';
import 'package:mastore/Model/product_detail_wrapper.dart';

import '../../Bloc/Home_bloc/home_bloc.dart';
import '../../Core/helpers/flutter_screen_scaler.dart';
import '../../Core/widgets/loading_page.dart';

class ProdukDetailPage extends StatefulWidget{
  final int? idProduk;
  const ProdukDetailPage({super.key, this.idProduk});

  @override
  State<ProdukDetailPage> createState() => ProdukDetailPageState();
}

class ProdukDetailPageState extends State<ProdukDetailPage>{
  late ProductDetailWrapper itemProduk = ProductDetailWrapper();
  final TextEditingController searchProduk = TextEditingController();
  
  var selected = 0;
  var jumlahBeli = 0;

  @override
  void initState() {
    context.read<ProfileBloc>().add(GetProfileUser());
    Future.delayed(const Duration(milliseconds: 100),() {
      context.read<ProdukBloc>().add(getDataDetailProduct(widget.idProduk ?? 0));
    });

    super.initState();
  }

  Future<bool> onWillPop() {
    Navigator.pushReplacementNamed(context, "HomeScreen", arguments: "0");

    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    return WillPopScope(
        onWillPop: onWillPop, 
        child: BlocBuilder<ProdukBloc, ProdukState>(
        builder: (context, state){
          if (state is GetProductDetailInitial){
            itemProduk = state.prodDetail;

            if (itemProduk == null){
              return const LoadingPage();
            } else {
              return BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, profState){
                    if (profState is UserProfileGetData){
                      return Scaffold(
                        appBar: AppBar(
                          backgroundColor: Colors.white,
                          leading: GestureDetector(
                            onTap: () => onWillPop(),
                            child: const Icon(Icons.arrow_back_ios_new, color: Colors.black,),
                          ),
                          flexibleSpace: Container(
                            margin: const EdgeInsets.only(left: 45, top: 26, right: 15, bottom: 5),
                            child: TextField(
                              controller: searchProduk,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(),
                                hintText: 'Search Here',
                              ),
                              onSubmitted: (val){
                                print(val);
                                print(val);
                                if (val.isEmpty) {
                                  searchProduk.clear();
                                  Future.delayed(const Duration(milliseconds: 20), (){
                                    context.read<HomeBloc>().add(GetProdukListData(13));
                                  });

                                  Future.delayed(const Duration(milliseconds: 30), (){
                                    context.read<HomeBloc>().add(GetProdukListData(9));
                                  });

                                  context.read<HomeBloc>().add(SearchProductReset());
                                } else {
                                  context.read<HomeBloc>().add(GetProductSearch(searchProduk.text));
                                }
                              },
                              onChanged: (val){
                                print(val);
                                if (val.isEmpty) {
                                  searchProduk.clear();
                                } else {
                                  context.read<HomeBloc>().add(GetProductSearch(searchProduk.text));
                                }
                              },
                            ),
                          ),
                          // title: StandarText.labelCustom("Detail Produk", 15.0, 2, fontWeight: FontWeight.w800,color: Colors.black),
                        ),
                        body: CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(
                              child: Container(
                                height: scaler.getHeight(35),
                                margin: const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 15),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage("$imageUrl${itemProduk.prdImage}"),
                                        fit: BoxFit.fill
                                    )
                                ),
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: Container(
                                margin: scaler.getMarginLTRB(2, 1, 2, 1),
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      child: StandarText.labelCustom(itemProduk.prdName, 25.0, 1),
                                    ),
                                    const SizedBox(height: 20,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            StandarText.labelCustom("Berat:", 17.0, 1, fontWeight: FontWeight.w600),
                                            StandarText.subtitle("${itemProduk.prdBerat} gr", 17.0),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            StandarText.labelCustom("Stok:", 17.0, 1, fontWeight: FontWeight.w600),
                                            StandarText.subtitle("${itemProduk.prdStok} ${itemProduk.prdSatuan}", 17.0),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            StandarText.labelCustom("Ulasan:", 17.0, 1, fontWeight: FontWeight.w600),
                                            StandarText.subtitle("${itemProduk.ulJumlah} ulasan", 17.0),
                                          ],
                                        ),
                                        // Row(
                                        //   children: [
                                        //     const Icon(Icons.storefront, color: Colors.black,),
                                        //     const SizedBox(width: 10,),
                                        //     StandarText.subtitle(itemProduk.prdKatName, 17.0),
                                        //   ],
                                        // ),
                                        // GestureDetector(
                                        //   onTap: (){},
                                        //   child: Container(
                                        //     height: scaler.getHeight(5),
                                        //     width: scaler.getWidth(30),
                                        //     decoration: BoxDecoration(
                                        //         color: Colors.green,
                                        //         borderRadius: BorderRadius.circular(15)
                                        //     ),
                                        //     child: Row(
                                        //       mainAxisAlignment: MainAxisAlignment.center,
                                        //       crossAxisAlignment: CrossAxisAlignment.center,
                                        //       children: [
                                        //         const Icon(Icons.chat_bubble_outline, color: Colors.white,),
                                        //         const SizedBox(width: 10,),
                                        //         StandarText.label("chat penjual", 12.0, Colors.white)
                                        //       ],
                                        //     ),
                                        //   ),
                                        // )
                                      ],
                                    ),
                                    const SizedBox(height: 20,),
                                    const Divider(thickness: 1, color: Colors.black38,),
                                    Container(
                                      height: scaler.getHeight(5),
                                      width: scaler.getWidth(100),
                                      alignment: Alignment.center,
                                      child: StandarText.labelCustom("Rp. ${itemProduk.prdHarga}", 26.0, 2,
                                          color: Colors.black, fontWeight: FontWeight.bold, textAlign: TextAlign.center),
                                    ),
                                    const SizedBox(height: 20,),
                                    Row(
                                      children: [
                                        const Icon(Icons.verified_user, color: Colors.green,),
                                        const SizedBox(width: 5,),
                                        StandarText.label("Verified", 12.0, Colors.green),
                                        const SizedBox(width: 10,),
                                        StandarText.labelCustom(itemProduk.prdResName, 18.0, 2, color: Colors.blue, fontWeight: FontWeight.normal)
                                      ],
                                    ),
                                    const Divider(thickness: 1, color: Colors.black38,),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              SizedBox(
                                                width: scaler.getWidth(20),
                                                child: StandarText.labelCustom("Nama Penjual : ", 14.0, 2, color: Colors.black, fontWeight: FontWeight.normal),
                                              ),
                                              SizedBox(
                                                width: scaler.getWidth(60),
                                                child: StandarText.labelCustom(itemProduk.prdResName, 14.0, 2, color: Colors.black, fontWeight: FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                width: scaler.getWidth(20),
                                                child: StandarText.labelCustom("Provinsi Penjual : ", 14.0, 2, color: Colors.black, fontWeight: FontWeight.normal),
                                              ),
                                              Container(
                                                width: scaler.getWidth(60),
                                                child: StandarText.labelCustom(itemProduk.resProvName, 14.0, 2, color: Colors.black, fontWeight: FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                width: scaler.getWidth(20),
                                                child: StandarText.labelCustom("Kota Penjual : ", 14.0, 2, color: Colors.black, fontWeight: FontWeight.normal),
                                              ),
                                              Container(
                                                width: scaler.getWidth(60),
                                                child: StandarText.labelCustom(itemProduk.resKokabName, 14.0, 2, color: Colors.black, fontWeight: FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                width: scaler.getWidth(20),
                                                child: StandarText.labelCustom("Alamat Penjual : ", 14.0, 2, color: Colors.black, fontWeight: FontWeight.normal),
                                              ),
                                              Container(
                                                width: scaler.getWidth(60),
                                                child: StandarText.labelCustom(itemProduk.resAlamat, 14.0, 2, color: Colors.black, fontWeight: FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        bottomNavigationBar: Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                                jumlahBeli = 1;
                                var totalHarga = int.parse(itemProduk.prdHargaKon ?? "") * jumlahBeli;
                                context.read<TransaksiBloc>().add(TransaksiAddToCart(
                                  itemProduk.prdImage ?? "",
                                  itemProduk.prdName ?? "",
                                  itemProduk.prdResName ?? "",
                                  itemProduk.resKokab ?? "",
                                  itemProduk.resId ?? 0,
                                  int.parse(profState.userLoginData?.data?.idUser ?? ""),
                                  itemProduk.prdId ?? 0,
                                  jumlahBeli,
                                  totalHarga,
                                  int.parse(itemProduk.prdBerat ?? ""),
                                ));
                                PopupCustom().dialogOption(context, "Berhasil Ditambahkan");
                              },
                              child: Container(
                                height: scaler.getHeight(5),
                                width: scaler.getWidth(46),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(0)
                                ),
                                child: StandarText.labelCustom("Masuk Keranjang", 18.0, 2,
                                    color: Colors.white, fontWeight: FontWeight.bold, textAlign: TextAlign.center),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                jumlahBeli = 1;
                                var totalHarga = int.parse(itemProduk.prdHargaKon ?? "") * jumlahBeli;
                                context.read<TransaksiBloc>().add(TransaksiAddToCart(
                                  itemProduk.prdImage ?? "",
                                  itemProduk.prdName ?? "",
                                  itemProduk.prdResName ?? "",
                                  itemProduk.resKokab ?? "",
                                  itemProduk.resId ?? 0,
                                  int.parse(profState.userLoginData?.data?.idUser ?? ""),
                                  itemProduk.prdId ?? 0,
                                  jumlahBeli,
                                  totalHarga,
                                  int.parse(itemProduk.prdBerat ?? ""),
                                ));

                                Navigator.pushNamed(context, "HomeScreen", arguments: "1");
                              },
                              child: Container(
                                height: scaler.getHeight(5),
                                width: scaler.getWidth(46),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(0)
                                ),
                                child: StandarText.labelCustom("Beli Sekarang", 18.0, 2,
                                    color: Colors.white, fontWeight: FontWeight.bold, textAlign: TextAlign.center),
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return LoadingPage();
                  }
              );
            }
          }

          return LoadingPage();
        }));
  }
}