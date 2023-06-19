import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:mastore/Core/services/Api_repository.dart';
import 'package:meta/meta.dart';

import '../../Model/add_to_cart_model.dart';

part 'transaksi_event.dart';
part 'transaksi_state.dart';

class TransaksiBloc extends Bloc<TransaksiEvent, TransaksiState> {
  List<AddToCartWrapper> respoTransaksi = [];
  String? namaPembeli;
  String? phonePembeli;
  String? namaPenjual;
  String? alamatPembeli;
  TransaksiBloc() : super(TransaksiInitial()) {
    on<TransaksiEvent>((event, emit) async {
      await mapEventToStates(event, emit);
    });
  }

  Future<void> mapEventToStates(
      TransaksiEvent event, Emitter<TransaksiState> emit
      ) async {

    if (event is TransaksiAddToCart){
      var checkId = respoTransaksi.where((element) => element.prdOwnId == event.idPenjual);
      if (checkId.isNotEmpty){
        print("masuk sini kalo id sudah ada");
        for (var element in respoTransaksi) {
          element.chartData?.add(ChartProductData(
              picture: event.picture,
              produkTitle: event.produkTitle,
              idProduk: event.idProduk,
              jumlah: event.jumlahBeli,
              hargaNum: event.totalHarga
          ));
        }
      } else {
        print("masuk sini pertama kali");
        respoTransaksi.add(
            AddToCartWrapper(
              prdOwnId: event.idPenjual,
              pembeliId: event.idPembeli,
              prdOwnName: event.namaPenjual,
              prdOwnKabupaten: event.idKabupatenAsal,
              prdOwnBerat: event.beratBarang.toString(),
              chartData: [
                ChartProductData(
                    picture: event.picture,
                    produkTitle: event.produkTitle,
                    idProduk: event.idProduk,
                    jumlah: event.jumlahBeli,
                    hargaNum: event.totalHarga
                )],
            ));
      }

      print("[data keranjang] ${jsonEncode(respoTransaksi)}");
      emit(TransaksiBerhasilDitambah(event.idKabupatenAsal, event.beratBarang.toString(),respoTransaksi));
    }

    if (event is GetNamaPembeli){
      namaPembeli = event.namaPembeli;
    }

    if (event is GetPhonePembeli){
      phonePembeli = event.phonePembeli;
    }

    if (event is GetNamaPenjual){
      namaPenjual = event.namaPenjual;
    }

    if (event is GetAlamatPembeli){
      alamatPembeli = event.alamatPembeli;
    }

    if (event is TransaksiPembayaran){
      var dataProduk;
      for (int i = 0; i < int.parse(event.chartProduk?.length.toString() ?? ""); i++){
        dataProduk = [
          ChartProductKirim(
              idProduk: event.chartProduk?[i].idProduk,
              jumlah: event.chartProduk?[i].jumlah,
              hargaNum: event.chartProduk?[i].hargaNum
          )
        ];
      }
      final response = await ApiRepository.postTransaksiPembayaran(
          event.idPembeli, event.idPenjual, event.kodeKurir, event.kurir, event.layanan, event.ongkir, dataProduk);
      print(response);
    }
  }
}
