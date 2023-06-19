import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastore/Bloc/Home_bloc/home_bloc.dart';
import 'package:mastore/Bloc/Produk_bloc/produk_bloc.dart';
import 'package:mastore/Core/widgets/loading_page.dart';
import 'package:mastore/Model/produkList_wrapper.dart';

import '../../Core/helpers/flutter_screen_scaler.dart';
import '../../Core/utils/constants.dart';
import '../../Core/widgets/StandarText.dart';

class SearchPage extends StatefulWidget{
  final int? prodId;
  const SearchPage({super.key, this.prodId});

  @override
  State<SearchPage> createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage>{
  late List<ProdukListWrapper> prodWrapper = [];
  TextEditingController searchProduk = TextEditingController();

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 200), (){
      context.read<ProdukBloc>().add(getDataProduk(widget.prodId ?? 0));
    });
    super.initState();
  }

  Future<bool> onWillPop() async {
    Navigator.of(context).pushReplacementNamed("HomeScreen", arguments: "0");
    prodWrapper.clear();

    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    return WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
      body: BlocBuilder<ProdukBloc, ProdukState>(
        builder: (context, prodState){
          if (prodState is GetProductInitial){
            prodWrapper = prodState.produkListWrapper;
            if (prodWrapper.isEmpty){
              return LoadingPage();
            } else {
              return Container(
                margin: const EdgeInsets.only(left: 20, top: 30, right: 20),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => onWillPop(),
                            child: const Icon(Icons.arrow_back_ios_new, color: Colors.black,),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            height: scaler.getHeight(4),
                            width: scaler.getWidth(70),
                            child: TextField(
                              controller: searchProduk,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(),
                                hintText: 'Search Here',
                              ),
                              onSubmitted: (val){
                                print(val);
                                if (val.isEmpty) {
                                  searchProduk.clear();
                                  Future.delayed(const Duration(milliseconds: 20), (){
                                    context.read<HomeBloc>().add(GetProdukListData(13));
                                  });

                                  Future.delayed(const Duration(milliseconds: 30), (){
                                    context.read<HomeBloc>().add(GetProdukListData(9));
                                  });
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
                        ],
                      ),
                    ),

                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 24,),
                          StandarText.header1(prodWrapper[0].prdKatName, 20.0),
                        ],
                      ),
                    ),

                    SliverGrid(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 5.0,
                          crossAxisSpacing: 5.0,
                          childAspectRatio: 0.7
                      ),
                      delegate: SliverChildListDelegate(
                          List.generate(prodWrapper.length,
                                  (index) => GestureDetector(
                                onTap: (){
                                  Navigator.pushNamed(context, "ProdukDetailPage",
                                      arguments: prodWrapper[index].prdId
                                  );
                                },
                                child: Container(
                                    height: scaler.getHeight(20),
                                    width: scaler.getWidth(30),
                                    margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                          image: NetworkImage("$imageUrl${prodWrapper[index].prdImage}"),
                                          fit: BoxFit.fill,
                                        )
                                    ),
                                    child: Container(
                                      height: scaler.getHeight(10),
                                      width: scaler.getWidth(50),
                                      margin: scaler.getMarginLTRB(0, 10, 0, 0),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.8),
                                        borderRadius: const BorderRadius.only(
                                            bottomRight: Radius.circular(15),
                                            bottomLeft: Radius.circular(15)),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          StandarText.label(prodWrapper[index].prdName, 12.0, Colors.black),
                                          Divider(thickness: 2,),
                                          StandarText.labelCustom(prodWrapper[index].prdNameSrt, 12.0, 3,
                                              color: Colors.black, fontWeight: FontWeight.normal, textAlign: TextAlign.center),
                                          StandarText.label("Rp. ${prodWrapper[index].prdHarga}", 12.0, Colors.black),
                                        ],
                                      ),
                                    )
                                ),
                              ))
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
    ));
  }
}