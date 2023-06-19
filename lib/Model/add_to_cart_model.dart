import 'dart:convert';

List<AddToCartWrapper> addToCartWrapperFromJson(String str) => List<AddToCartWrapper>.from(json.decode(str).map((x) => AddToCartWrapper.fromJson(x)));

String addToCartWrapperToJson(List<AddToCartWrapper> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddToCartWrapper {
  AddToCartWrapper({
    this.prdOwnId,
    this.pembeliId,
    this.prdOwnName,
    this.prdOwnKabupaten,
    this.prdOwnBerat,
    this.chartData,
  });

  int? prdOwnId;
  int? pembeliId;
  String? prdOwnName;
  String? prdOwnKabupaten;
  String? prdOwnBerat;
  List<ChartProductData>? chartData;

  factory AddToCartWrapper.fromJson(Map<String, dynamic> json) => AddToCartWrapper(
    prdOwnId: json["product_owner_id"],
    pembeliId: json["pembeli_id"],
    prdOwnName: json["product_owner_name"],
    prdOwnKabupaten: json["product_owner_kabupaten_id"],
    prdOwnBerat: json["product_owner_berat"],
    chartData: json["data_product"] == null ? null : List<ChartProductData>.from(json["data_product"]!.map((x) => ChartProductData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "product_owner_id": prdOwnId,
    "pembeli_id": pembeliId,
    "product_owner_name": prdOwnName,
    "product_owner_kabupaten_id": prdOwnKabupaten,
    "product_owner_berat": prdOwnBerat,
    "data_product": chartData == null ? []: List<dynamic>.from(chartData!.map((x) => x.toJson())),
  };
}

class ChartProductData {
  ChartProductData({
    this.picture,
    this.produkTitle,
    this.idProduk,
    this.jumlah,
    this.hargaNum,
  });

  String? picture;
  String? produkTitle;
  int? idProduk;
  int? jumlah;
  int? hargaNum;

  factory ChartProductData.fromJson(Map<String, dynamic> json) => ChartProductData(
    picture: json["picture_product"],
    produkTitle: json["title_produk"],
    idProduk: json["id_produk"],
    jumlah: json["jumlah"],
    hargaNum: json["harga_num"],
  );

  Map<String, dynamic> toJson() => {
    "picture_product": picture,
    "title_produk": produkTitle,
    "id_produk": idProduk,
    "jumlah": jumlah,
    "harga_num": hargaNum,
  };
}

class ChartProductKirim {
  ChartProductKirim({
    this.idProduk,
    this.jumlah,
    this.hargaNum,
  });

  int? idProduk;
  int? jumlah;
  int? hargaNum;

  factory ChartProductKirim.fromJson(Map<String, dynamic> json) => ChartProductKirim(
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