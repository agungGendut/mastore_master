part of 'transaksi_bloc.dart';

@immutable
abstract class TransaksiState {}

class TransaksiInitial extends TransaksiState {}

class TransaksiBerhasilDitambah extends TransaksiState {
  final String? idKabupaten;
  final String? beratBarang;
  final List<AddToCartWrapper> chartProduk;
  TransaksiBerhasilDitambah(this.idKabupaten, this.beratBarang, this.chartProduk);
}
