part of 'transaksi_bloc.dart';

@immutable
abstract class TransaksiEvent {}

class TransaksiAddToCart extends TransaksiEvent {
  final String picture;
  final String produkTitle;
  final String namaPenjual;
  final String idKabupatenAsal;
  final int idPenjual;
  final int idPembeli;
  final int idProduk;
  final int jumlahBeli;
  final int totalHarga;
  final int beratBarang;
  TransaksiAddToCart(
      this.picture,
      this.produkTitle,
      this.namaPenjual,
      this.idKabupatenAsal,
      this.idPenjual,
      this.idPembeli,
      this.idProduk,
      this.jumlahBeli,
      this.totalHarga,
      this.beratBarang);
}

class TransaksiPembayaran extends TransaksiEvent {
  final String idPembeli;
  final String idPenjual;
  final String kodeKurir;
  final String kurir;
  final String layanan;
  final String ongkir;
  final List<ChartProductData>? chartProduk;
  TransaksiPembayaran(this.idPembeli, this.idPenjual, this.kodeKurir, this.kurir, this.layanan, this.ongkir, this.chartProduk);
}

class GetNamaPembeli extends TransaksiEvent {
  final String namaPembeli;
  GetNamaPembeli(this.namaPembeli);
}

class GetPhonePembeli extends TransaksiEvent{
  final String phonePembeli;
  GetPhonePembeli(this.phonePembeli);
}

class GetNamaPenjual extends TransaksiEvent{
  final String namaPenjual;
  GetNamaPenjual(this.namaPenjual);
}

class GetAlamatPembeli extends TransaksiEvent{
  final String alamatPembeli;
  GetAlamatPembeli(this.alamatPembeli);
}

class SaveAlamatTransaksi extends TransaksiEvent{

}
