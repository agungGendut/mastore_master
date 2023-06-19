import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastore/Bloc/transaksi_bloc/transaksi_bloc.dart';

import '../../Bloc/Profile_bloc/profile_bloc.dart';
import '../../Core/utils/constants.dart';
import '../../Core/widgets/StandarText.dart';
import '../../Core/widgets/number_increment.dart';
import '../../Model/add_to_cart_model.dart';

class ChartPage extends StatefulWidget{
  final int? produkId;
  const ChartPage({super.key, this.produkId});

  @override
  State<ChartPage> createState() => ChartPageState();
}

class ChartPageState extends State<ChartPage>{
  final TextEditingController _controller = TextEditingController();
  bool isExpanded = false;
  List<bool> checkedItems = [false, false, false, false];
  int? totalHarga = 0;
  String idPenjual = "";

  @override
  void initState() {
    _controller.text = "1";
    super.initState();
  }

  int calculateTotalHarga(AddToCartWrapper addToCartWrapper) {
    if (addToCartWrapper.chartData == null) {
      return 0;
    }

    return addToCartWrapper.chartData!.map((data) => (data.jumlah ?? 0) * (data.hargaNum ?? 0)).reduce((value, element) => value + element);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<TransaksiBloc, TransaksiState>(
        listener: (context, state){
          if (state is TransaksiBerhasilDitambah){
            totalHarga = calculateTotalHarga(state.chartProduk[0]);
          }
        },
        builder: (context, state){
          if (state is TransaksiBerhasilDitambah){
            for (var element in state.chartProduk) {
              idPenjual = element.prdOwnId.toString();
            }

            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  leading: Container(),
                  elevation: 2,
                  flexibleSpace: Container(
                    margin: const EdgeInsets.only(left: 12, top: 35, right: 15),
                    child: StandarText.labelCustom("Keranjang", 24.0, 1, color: Colors.deepOrangeAccent, fontWeight: FontWeight.w400),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 15),
                    child: StandarText.header1("Data Produk", 20.0),
                  ),
                ),
                
                SliverList(
                    delegate: SliverChildListDelegate(
                      List.generate(
                          state.chartProduk.length,
                              (index) => Container(
                                width: double.infinity,
                                alignment: Alignment.centerLeft,
                                child: ExpansionTile(
                                  title: CheckboxListTile(
                                    title: Text(state.chartProduk[index].prdOwnName ?? "",
                                      style: const TextStyle(fontSize: 25),),
                                    value: isExpanded,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isExpanded = value!;
                                        checkedItems = List<bool>.filled(checkedItems.length, isExpanded);
                                        totalHarga = calculateTotalHarga(state.chartProduk[index]);
                                      });
                                    },
                                    controlAffinity: ListTileControlAffinity.leading,
                                  ),
                                  collapsedBackgroundColor: Colors.white,
                                  initiallyExpanded: true,
                                  children: List.generate(state.chartProduk[index].chartData?.length ?? 0,
                                          (idx){
                                    return Container(
                                      margin: const EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 0),
                                      child: CheckboxListTile(
                                        title: SizedBox(
                                          height: 80,
                                          width: MediaQuery.of(context).size.width * 1,
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 60,
                                                width: 60,
                                                margin: const EdgeInsets.only(left: 0),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(13),
                                                    image: DecorationImage(
                                                        image: NetworkImage("$imageUrl${state.chartProduk[index].chartData?[idx].picture}"),
                                                        fit: BoxFit.fill
                                                    )
                                                ),
                                              ),
                                              const SizedBox(width: 5,),
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Text(state.chartProduk[index].chartData?[idx].produkTitle ?? ""),
                                                    const SizedBox(width: 5,),
                                                    SizedBox(
                                                      height: 78,
                                                      width: 120,
                                                      child: NumberInputWithIncrementDecrement(
                                                        controller: _controller,
                                                        onTapUp:() {
                                                          int currentValue = int.parse(_controller.text);
                                                          totalHarga = 0;
                                                          setState(() {
                                                            currentValue++;
                                                            _controller.text = (currentValue).toString();
                                                            totalHarga = (state.chartProduk[index].chartData?[idx].hargaNum ?? 0) * currentValue;
                                                          });
                                                        },
                                                        onTapDown: (){
                                                          int currentValue = int.parse(_controller.text);
                                                          totalHarga = 0;
                                                          setState(() {
                                                            print("Setting state");
                                                            currentValue--;
                                                            _controller.text = (currentValue > 0 ? currentValue : 0).toString();
                                                            totalHarga = (state.chartProduk[index].chartData?[idx].hargaNum ?? 0) * currentValue;
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                    const SizedBox(width: 5,),
                                                    Container(
                                                      height: 20,
                                                      width: 80,
                                                      alignment: Alignment.center,
                                                      child: Row(
                                                        children: [
                                                          const Text("Rp."),
                                                          const SizedBox(width: 5,),
                                                          Text(state.chartProduk[index].chartData?[idx].hargaNum.toString() ?? "",
                                                            style: const TextStyle(color: Colors.black),)
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        value: checkedItems[index],
                                        onChanged: (bool? value) {
                                          setState(() {
                                            checkedItems[index] = value!;
                                          });
                                        },
                                        controlAffinity: ListTileControlAffinity.leading,
                                      ) ,
                                    );
                                      }),
                                ),
                              ))
                    )
                ),
              ],
            );
          }
          
          return Container();
        },
      ),
      bottomNavigationBar: Container(
        height: 80,
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            const Divider(thickness: 1, color: Colors.red,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StandarText.label("Total", 18.0),
                    Container(
                      height: 20,
                      width: 140,
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          const Text("Rp.", style: TextStyle(color: Colors.red, fontSize: 18),),
                          const SizedBox(width: 5,),
                          Text(totalHarga.toString(),
                            style: const TextStyle(color: Colors.red, fontSize: 18),)
                        ],
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    print("dapat id penjual $idPenjual");
                    if (checkedItems.first == false){

                    } else {
                      context.read<ProfileBloc>().add(GetProfileUser());
                      Navigator.pushNamed(context, "checkoutPage", arguments: idPenjual);
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 180,
                    padding: const EdgeInsets.only(left: 10, top: 15, bottom: 15, right: 15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.deepOrangeAccent
                    ),
                    child: StandarText.labelCustom("Lanjut ke pembayaran", 14.0, 2,color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}