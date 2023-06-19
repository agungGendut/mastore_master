import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastore/Bloc/Home_bloc/home_bloc.dart';
import 'package:mastore/Core/helpers/flutter_screen_scaler.dart';
import 'package:mastore/Core/utils/constants.dart';

import '../../Core/utils/palette.dart';
import '../../Core/widgets/StandarText.dart';
import '../../Core/widgets/card_list.dart';
import '../../Core/widgets/loading_page.dart';
import '../../Model/produkList_wrapper.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<ProdukListWrapper>? prodByCatTanaman = [];
  late List<ProdukListWrapper>? prodByCatTernak = [];
  late List<ProdukListWrapper>? prodByCatBuah = [];
  late List<ProdukListWrapper>? prodByCatSayuran = [];
  late List<ProdukListWrapper>? prodByCatOlahan = [];
  late List<ProdukListWrapper>? prodByCatAlat = [];
  late List<ProdukListWrapper>? prodByCatLainya = [];
  late List<ProdukListWrapper>? prodSearch = [];

  var currentIndex = 0;
  TextEditingController searchProduk = TextEditingController();

  @override
  void initState() {
    context.read<HomeBloc>().add(GetHomeMenuData());

    Future.delayed(const Duration(milliseconds: 0), (){
      context.read<HomeBloc>().add(GetCategoryMenuData());
    });

    Future.delayed(const Duration(milliseconds: 20), (){
      context.read<HomeBloc>().add(GetProdukListData(13));
    });

    Future.delayed(const Duration(milliseconds: 30), (){
      context.read<HomeBloc>().add(GetProdukListData(9));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.bgcolorWhite,
        elevation: 0,
        leading: Container(),
        flexibleSpace: Container(
          margin: const EdgeInsets.only(left: 15, top: 26, right: 10, bottom: 5),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: scaler.getHeight(20),
                width: scaler.getWidth(60),
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
                      prodByCatTanaman?.clear();
                      prodByCatSayuran?.clear();
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
                      prodByCatTanaman?.clear();
                      prodByCatSayuran?.clear();
                    } else {
                      context.read<HomeBloc>().add(GetProductSearch(searchProduk.text));
                    }
                  },
                ),
              ),
              Row(
                children: [
                  // GestureDetector(
                  //   onTap: (){
                  //     // Navigator.of(context).pushReplacementNamed("ChartScreen");
                  //   },
                  //   child: const Icon(Icons.shopping_cart_outlined, color: Colors.black,),
                  // ),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){},
                    child: const CircleAvatar(
                      radius: 15,
                      child: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(width: 10,),
                ],
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, homeState){
          if (homeState is GetHomeMenuInitial) {
            prodByCatSayuran = homeState.produkListWrapper.where((element) => element.prdKatName == "Sayuran dan Rempah").toList();
            prodByCatTernak = homeState.produkListWrapper.where((element) => element.prdKatName == "Ternak").toList();
            prodByCatTanaman = homeState.produkListWrapper.where((element) => element.prdKatName == "Tanaman Hias").toList();
            prodByCatBuah = homeState.produkListWrapper.where((element) => element.prdKatName == "Buah dan Polong").toList();
            prodByCatAlat = homeState.produkListWrapper.where((element) => element.prdKatName == "Media dan Alat").toList();
            prodByCatOlahan = homeState.produkListWrapper.where((element) => element.prdKatName == "Olahan").toList();
            prodByCatLainya = homeState.produkListWrapper.where((element) => element.prdKatName == "Lainya").toList();
            prodSearch = homeState.produkSearch;

            if (prodSearch!.isEmpty) {
              if (homeState.produkListWrapper.isEmpty) {
                return const LoadingPage();
              } else {
                return Container(
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  child: CustomScrollView(
                    slivers: [

                      SliverToBoxAdapter(
                        child: Container(
                          width: scaler.getWidth(30),
                          margin: const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16)
                          ),
                          child: Image.asset(AppIcons.ic_logo, fit: BoxFit.fill,),
                        ),
                      ),

                      ///banner section
                      SliverToBoxAdapter(
                        child: CarouselSlider(
                          options: CarouselOptions(height: 150.0, autoPlay: true),
                          items: homeState.menuWrapper.results![0].items!.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                    decoration: const BoxDecoration(
                                        color: Colors.amber
                                    ),
                                    child: Image.asset(i.picture ?? "", fit: BoxFit.fill,)
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),

                      ///category section
                      SliverToBoxAdapter(
                        child: Container(
                          margin: const EdgeInsets.only(top: 24.0, bottom: 0.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 40,
                                width: 180,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  color: Colors.green
                                ),
                                child: StandarText.header2(homeState.menuWrapper.results![2].tittle, 20.0),
                              ),
                              SizedBox(height: 16,),
                              Container(
                                height: 280,
                                alignment: Alignment.center,
                                child: GridView.builder(
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      crossAxisSpacing: 10.0,
                                      mainAxisSpacing: 10.0,
                                      childAspectRatio: 0.9,
                                    ),
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: homeState.cateGoryWrapper.length,
                                    itemBuilder: (context, index){
                                      return GestureDetector(
                                        onTap: (){
                                          Navigator.of(context).pushReplacementNamed("SearchScreen",
                                              arguments: homeState.cateGoryWrapper[index].katId);
                                        },
                                        child: Container(
                                            height: scaler.getHeight(5),
                                            width: scaler.getWidth(19.5),
                                            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(16)
                                            ),
                                            alignment: Alignment.center,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Image.network("$imageUrl${homeState.cateGoryWrapper[index].katImage}",
                                                  fit: BoxFit.fill, scale: 5,),
                                                StandarText.labelCustom(homeState.cateGoryWrapper[index].katName, 12.0, 5,
                                                    color: Colors.black, textAlign: TextAlign.center),
                                              ],
                                            )
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),

                      ///Produk Sayuran dan Rempah section
                      SliverToBoxAdapter(
                        child: prodByCatSayuran!.isNotEmpty
                            ? Container(
                          margin: const EdgeInsets.only(top: 24.0, bottom: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 24,),
                              Container(
                                height: 40,
                                width: 220,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                                  color: Colors.orange
                                ),
                                child: StandarText.header2(prodByCatSayuran?[0].prdKatName ?? "Sayuran dan Rempah", 20.0),
                              ),
                              const SizedBox(height: 16,),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(prodByCatSayuran?.length ?? 0, (index) {
                                    var itemByCategory = prodByCatSayuran;
                                    return GestureDetector(
                                      onTap: (){
                                        Navigator.pushNamed(context, "ProdukDetailPage",
                                            arguments: prodByCatSayuran?[index].prdId);
                                      },
                                      child: CardListWidget(
                                        context: context,
                                        image: "$imageUrl${itemByCategory?[index].prdImage}",
                                        prdName: itemByCategory?[index].prdName,
                                        prdDesc: itemByCategory?[index].prdNameSrt,
                                        prdPrice: itemByCategory?[index].prdHarga,
                                      ),
                                    );
                                  }),
                                ),
                              )
                            ],
                          ),
                        )
                            : Container(),
                      ),

                      ///Produk Ternak section
                      SliverToBoxAdapter(
                        child: prodByCatTernak!.isNotEmpty
                            ? Container(
                          margin: const EdgeInsets.only(top: 24.0, bottom: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 24,),
                              Container(
                                height: 40,
                                width: 220,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                                    color: Colors.orange
                                ),
                                child: StandarText.header2(prodByCatTernak?[0].prdKatName ?? "Ternak", 20.0),
                              ),
                              const SizedBox(height: 16,),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(prodByCatTernak?.length ?? 0, (index) {
                                    var itemByCategory = prodByCatTernak;
                                    return GestureDetector(
                                      onTap: (){
                                        Navigator.pushNamed(context, "ProdukDetailPage",
                                            arguments: prodByCatTernak?[index].prdId);
                                      },
                                      child: CardListWidget(
                                        context: context,
                                        image: "$imageUrl${itemByCategory?[index].prdImage}",
                                        prdName: itemByCategory?[index].prdName,
                                        prdDesc: itemByCategory?[index].prdNameSrt,
                                        prdPrice: itemByCategory?[index].prdHarga,
                                      ),
                                    );
                                  }),
                                ),
                              )
                            ],
                          ),
                        )
                            : Container(),
                      ),

                      ///Produk tanaman Hias section
                      SliverToBoxAdapter(
                        child: prodByCatTanaman!.isNotEmpty
                            ? Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 24,),
                              Container(
                                height: 40,
                                width: 180,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                                    color: Colors.deepOrange
                                ),
                                child: StandarText.header2(prodByCatTanaman?[0].prdKatName, 20.0),
                              ),
                              const SizedBox(height: 16,),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(prodByCatTanaman?.length ?? 0, (index) {
                                    var itemByCategory = prodByCatTanaman;
                                    return GestureDetector(
                                      onTap: (){
                                        Navigator.pushNamed(context, "ProdukDetailPage",
                                            arguments: prodByCatTanaman?[index].prdId);
                                      },
                                      child: CardListWidget(
                                        context: context,
                                        image: "$imageUrl${itemByCategory?[index].prdImage}",
                                        prdName: itemByCategory?[index].prdName,
                                        prdDesc: itemByCategory?[index].prdNameSrt,
                                        prdPrice: itemByCategory?[index].prdHarga,
                                      ),
                                    );
                                  }),
                                ),
                              )
                            ],
                          ),
                        )
                            : Container(),
                      ),

                      ///Produk buah dan polong section
                      SliverToBoxAdapter(
                        child: prodByCatBuah!.isNotEmpty
                            ? Container(
                          margin: const EdgeInsets.only(top: 24.0, bottom: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 24,),
                              Container(
                                height: 40,
                                width: 220,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                                    color: Colors.orange
                                ),
                                child: StandarText.header2(prodByCatBuah?[0].prdKatName ?? "Buah dan Polong", 20.0),
                              ),
                              const SizedBox(height: 16,),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(prodByCatBuah?.length ?? 0, (index) {
                                    var itemByCategory = prodByCatBuah;
                                    return GestureDetector(
                                      onTap: (){
                                        Navigator.pushNamed(context, "ProdukDetailPage",
                                            arguments: prodByCatBuah?[index].prdId);
                                      },
                                      child: CardListWidget(
                                        context: context,
                                        image: "$imageUrl${itemByCategory?[index].prdImage}",
                                        prdName: itemByCategory?[index].prdName,
                                        prdDesc: itemByCategory?[index].prdNameSrt,
                                        prdPrice: itemByCategory?[index].prdHarga,
                                      ),
                                    );
                                  }),
                                ),
                              )
                            ],
                          ),
                        )
                            : Container(),
                      ),

                      ///Produk Media dan alat section
                      SliverToBoxAdapter(
                        child: prodByCatAlat!.isNotEmpty
                            ? Container(
                          margin: const EdgeInsets.only(top: 24.0, bottom: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 24,),
                              Container(
                                height: 40,
                                width: 220,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                                    color: Colors.orange
                                ),
                                child: StandarText.header2(prodByCatAlat?[0].prdKatName ?? "Buah dan Polong", 20.0),
                              ),
                              const SizedBox(height: 16,),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(prodByCatAlat?.length ?? 0, (index) {
                                    var itemByCategory = prodByCatAlat;
                                    return GestureDetector(
                                      onTap: (){
                                        Navigator.pushNamed(context, "ProdukDetailPage",
                                            arguments: prodByCatAlat?[index].prdId);
                                      },
                                      child: CardListWidget(
                                        context: context,
                                        image: "$imageUrl${itemByCategory?[index].prdImage}",
                                        prdName: itemByCategory?[index].prdName,
                                        prdDesc: itemByCategory?[index].prdNameSrt,
                                        prdPrice: itemByCategory?[index].prdHarga,
                                      ),
                                    );
                                  }),
                                ),
                              )
                            ],
                          ),
                        )
                            : Container(),
                      ),

                      ///Produk Olahan section
                      SliverToBoxAdapter(
                        child: prodByCatOlahan!.isNotEmpty
                            ? Container(
                          margin: const EdgeInsets.only(top: 24.0, bottom: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 24,),
                              Container(
                                height: 40,
                                width: 220,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                                    color: Colors.orange
                                ),
                                child: StandarText.header2(prodByCatOlahan?[0].prdKatName ?? "Buah dan Polong", 20.0),
                              ),
                              const SizedBox(height: 16,),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(prodByCatOlahan?.length ?? 0, (index) {
                                    var itemByCategory = prodByCatOlahan;
                                    return GestureDetector(
                                      onTap: (){
                                        Navigator.pushNamed(context, "ProdukDetailPage",
                                            arguments: prodByCatOlahan?[index].prdId);
                                      },
                                      child: CardListWidget(
                                        context: context,
                                        image: "$imageUrl${itemByCategory?[index].prdImage}",
                                        prdName: itemByCategory?[index].prdName,
                                        prdDesc: itemByCategory?[index].prdNameSrt,
                                        prdPrice: itemByCategory?[index].prdHarga,
                                      ),
                                    );
                                  }),
                                ),
                              )
                            ],
                          ),
                        )
                            : Container(),
                      ),

                      ///Produk Lainnya section
                      SliverToBoxAdapter(
                        child: prodByCatLainya!.isNotEmpty
                            ? Container(
                          margin: const EdgeInsets.only(top: 24.0, bottom: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 24,),
                              Container(
                                height: 40,
                                width: 220,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                                    color: Colors.orange
                                ),
                                child: StandarText.header2(prodByCatLainya?[0].prdKatName ?? "Buah dan Polong", 20.0),
                              ),
                              const SizedBox(height: 16,),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(prodByCatLainya?.length ?? 0, (index) {
                                    var itemByCategory = prodByCatLainya;
                                    return GestureDetector(
                                      onTap: (){
                                        Navigator.pushNamed(context, "ProdukDetailPage",
                                            arguments: prodByCatLainya?[index].prdId);
                                      },
                                      child: CardListWidget(
                                        context: context,
                                        image: "$imageUrl${itemByCategory?[index].prdImage}",
                                        prdName: itemByCategory?[index].prdName,
                                        prdDesc: itemByCategory?[index].prdNameSrt,
                                        prdPrice: itemByCategory?[index].prdHarga,
                                      ),
                                    );
                                  }),
                                ),
                              )
                            ],
                          ),
                        )
                            : Container(),
                      ),
                    ],
                  ),
                );
              }
            } else {
              return Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        width: scaler.getWidth(30),
                        margin: const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16)
                        ),
                        child: Image.asset(AppIcons.ic_logo, fit: BoxFit.fill,),
                      ),
                    ),

                    ///banner section
                    SliverToBoxAdapter(
                      child: CarouselSlider(
                        options: CarouselOptions(height: 150.0, autoPlay: true),
                        items: homeState.menuWrapper.results?[0].items?.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration: const BoxDecoration(
                                      color: Colors.amber
                                  ),
                                  child: Image.asset(i.picture ?? "", fit: BoxFit.fill,)
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),

                    ///Produk Search Section
                    SliverToBoxAdapter(
                      child: Container(
                        margin: const EdgeInsets.only(top: 24.0, bottom: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StandarText.header1("Your Search result", 20.0),
                            // SingleChildScrollView(
                            //   scrollDirection: Axis.horizontal,
                            //   child: Column(
                            //     children: List.generate(homeState.produkSearch.length, (index) {
                            //       var itemByCategory = homeState.produkSearch;
                            //       return GestureDetector(
                            //         onTap: (){
                            //           Navigator.pushNamed(context, "ProdukDetailPage",
                            //               arguments: homeState.menuWrapper.results![3].items![index].id);
                            //         },
                            //         child: Container(
                            //             height: scaler.getHeight(20),
                            //             width: scaler.getWidth(30),
                            //             margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                            //             decoration: BoxDecoration(
                            //                 color: Colors.white,
                            //                 borderRadius: BorderRadius.circular(15),
                            //                 image: DecorationImage(
                            //                   image: NetworkImage("$imageUrl${itemByCategory[index].prdImage}"),
                            //                   fit: BoxFit.fill,
                            //                 )
                            //             ),
                            //             child: Container(
                            //               height: scaler.getHeight(10),
                            //               width: scaler.getWidth(50),
                            //               margin: scaler.getMarginLTRB(0, 10, 0, 0),
                            //               decoration: BoxDecoration(
                            //                 color: Colors.white.withOpacity(0.8),
                            //                 borderRadius: const BorderRadius.only(
                            //                     bottomRight: Radius.circular(15),
                            //                     bottomLeft: Radius.circular(15)),
                            //               ),
                            //               child: Column(
                            //                 mainAxisAlignment: MainAxisAlignment.center,
                            //                 crossAxisAlignment: CrossAxisAlignment.center,
                            //                 children: [
                            //                   StandarText.label(homeState.produkListWrapper[index].prdName, 12.0, Colors.black),
                            //                   Divider(thickness: 2,),
                            //                   StandarText.labelCustom(itemByCategory[index].prdNameSrt, 12.0, 3,
                            //                       color: Colors.black, fontWeight: FontWeight.normal, textAlign: TextAlign.center),
                            //                   StandarText.label("Rp. ${itemByCategory[index].prdHarga}", 12.0, Colors.black),
                            //                 ],
                            //               ),
                            //             )
                            //         ),
                            //       );
                            //     }),
                            //   ),
                            // )
                          ],
                        ),
                      ),
                    ),

                    SliverGrid(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 5.0,
                          childAspectRatio: 0.6
                      ),
                      delegate: SliverChildListDelegate(
                          List.generate(prodSearch!.length, (index) {
                            var itemByCategory = prodSearch;
                            return GestureDetector(
                              onTap: (){
                                Navigator.pushNamed(context, "ProdukDetailPage",
                                    arguments: prodSearch?[index].prdId);
                              },
                              child: Container(
                                  height: scaler.getHeight(20),
                                  width: scaler.getWidth(30),
                                  margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        image: NetworkImage("$imageUrl${itemByCategory?[index].prdImage}"),
                                        fit: BoxFit.fill,
                                      )
                                  ),
                                child: CardListWidget(
                                  context: context,
                                  image: "$imageUrl${itemByCategory?[index].prdImage}",
                                  prdName: homeState.produkListWrapper[index].prdName,
                                  prdDesc: itemByCategory?[index].prdNameSrt,
                                  prdPrice: itemByCategory?[index].prdHarga,
                                ),
                              ),
                            );
                          })
                      ),
                    )
                  ],
                ),
              );
            }
          }

          return LoadingPage();
        },
      ),
    );
  }
}