import 'dart:convert';

ProductDetailWrapper productDetailWrapperFromJson(String str) => ProductDetailWrapper.fromJson(json.decode(str));

String productDetailWrapperToJson(ProductDetailWrapper data) => json.encode(data.toJson());

class ProductDetailWrapper {
  ProductDetailWrapper({
    this.prdId,
    this.katId,
    this.prdName,
    this.prdNameSrt,
    this.prdImage,
    this.prdHarga,
    this.prdHargaNum,
    this.katsubId,
    this.resId,
    this.prdKatName,
    this.prdKatsubName,
    this.prdResName,
    this.prdSatuan,
    this.prdHargaRes,
    this.prdHargaKon,
    this.prdBerat,
    this.prdTentang,
    this.prdDeskripsi,
    this.prdAktif,
    this.prdDilihat,
    this.resKokab,
    this.resAlamat,
    this.resKokabName,
    this.resProvName,
    this.prdStok,
    this.ulBintang,
    this.ulJumlah,
  });

  int? prdId;
  int? katId;
  String? prdName;
  String? prdNameSrt;
  String? prdImage;
  String? prdHarga;
  String? prdHargaNum;
  int? katsubId;
  int? resId;
  String? prdKatName;
  String? prdKatsubName;
  String? prdResName;
  String? prdSatuan;
  String? prdHargaRes;
  String? prdHargaKon;
  String? prdBerat;
  String? prdTentang;
  String? prdDeskripsi;
  String? prdAktif;
  String? prdDilihat;
  String? resKokab;
  String? resAlamat;
  String? resKokabName;
  String? resProvName;
  String? prdStok;
  String? ulBintang;
  String? ulJumlah;

  factory ProductDetailWrapper.fromJson(Map<String, dynamic> json) => ProductDetailWrapper(
    prdId: json["prd_id"],
    katId: json["kat_id"],
    prdName: json["prd_name"],
    prdNameSrt: json["prd_name_srt"],
    prdImage: json["prd_image"],
    prdHarga: json["prd_harga"],
    prdHargaNum: json["prd_harga_num"],
    katsubId: json["katsub_id"],
    resId: json["res_id"],
    prdKatName: json["prd_kat_name"],
    prdKatsubName: json["prd_katsub_name"],
    prdResName: json["prd_res_name"],
    prdSatuan: json["prd_satuan"],
    prdHargaRes: json["prd_harga_res"],
    prdHargaKon: json["prd_harga_kon"],
    prdBerat: json["prd_berat"],
    prdTentang: json["prd_tentang"],
    prdDeskripsi: json["prd_deskripsi"],
    prdAktif: json["prd_aktif"],
    prdDilihat: json["prd_dilihat"],
    resKokab: json["res_kokab"],
    resAlamat: json["res_alamat"],
    resKokabName: json["res_kokab_name"],
    resProvName: json["res_prov_name"],
    prdStok: json["prd_stok"],
    ulBintang: json["ul_bintang"],
    ulJumlah: json["ul_jumlah"],
  );

  Map<String, dynamic> toJson() => {
    "prd_id": prdId,
    "kat_id": katId,
    "prd_name": prdName,
    "prd_name_srt": prdNameSrt,
    "prd_image": prdImage,
    "prd_harga": prdHarga,
    "prd_harga_num": prdHargaNum,
    "katsub_id": katsubId,
    "res_id": resId,
    "prd_kat_name": prdKatName,
    "prd_katsub_name": prdKatsubName,
    "prd_res_name": prdResName,
    "prd_satuan": prdSatuan,
    "prd_harga_res": prdHargaRes,
    "prd_harga_kon": prdHargaKon,
    "prd_berat": prdBerat,
    "prd_tentang": prdTentang,
    "prd_deskripsi": prdDeskripsi,
    "prd_aktif": prdAktif,
    "prd_dilihat": prdDilihat,
    "res_kokab": resKokab,
    "res_alamat": resAlamat,
    "res_kokab_name": resKokabName,
    "res_prov_name": resProvName,
    "prd_stok": prdStok,
    "ul_bintang": ulBintang,
    "ul_jumlah": ulJumlah,
  };
}