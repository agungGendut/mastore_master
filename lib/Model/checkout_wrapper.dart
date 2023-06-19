import 'dart:convert';

List<CheckoutWrapper> CheckoutWrapperFromJson(String str) => List<CheckoutWrapper>.from(json.decode(str).map((x) => CheckoutWrapper.fromJson(x)));

String CheckoutWrapperToJson(List<CheckoutWrapper> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CheckoutWrapper {
  CheckoutWrapper({
    this.idProduk,
    this.jumlah,
    this.hargaNum,
  });

  int? idProduk;
  int? jumlah;
  int? hargaNum;

  factory CheckoutWrapper.fromJson(Map<String, dynamic> json) => CheckoutWrapper(
    idProduk: json["id_produk"],
    jumlah: json["jumlah"],
    hargaNum: json["harga_num"],
  );

  Map<String, dynamic> toJson() => {
    "id_produk": idProduk,
    "jumlah": jumlah,
    "harga_num": hargaNum,
  };
}