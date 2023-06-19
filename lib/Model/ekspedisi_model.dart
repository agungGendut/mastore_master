import 'dart:convert';

EkspedisiWrapper ekspedisiWrapperFromJson(String str) => EkspedisiWrapper.fromJson(json.decode(str));

String ekspedisiWrapperToJson(EkspedisiWrapper data) => json.encode(data.toJson());

class EkspedisiWrapper {
  DataKurir? data;

  EkspedisiWrapper({
    this.data,
  });

  factory EkspedisiWrapper.fromJson(Map<String, dynamic> json) => EkspedisiWrapper(
    data: json["data"] == null ? null : DataKurir.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class DataKurir {
  List<ListKurir>? listKurir;
  List<JasaPengiriman>? jasaPengiriman;

  DataKurir({
    this.listKurir,
    this.jasaPengiriman,
  });

  factory DataKurir.fromJson(Map<String, dynamic> json) => DataKurir(
    listKurir: json["List_kurir"] == null ? [] : List<ListKurir>.from(json["List_kurir"]!.map((x) => ListKurir.fromJson(x))),
    jasaPengiriman: json["Jasa_pengiriman"] == null ? [] : List<JasaPengiriman>.from(json["Jasa_pengiriman"]!.map((x) => JasaPengiriman.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "List_kurir": listKurir == null ? [] : List<dynamic>.from(listKurir!.map((x) => x.toJson())),
    "Jasa_pengiriman": jasaPengiriman == null ? [] : List<dynamic>.from(jasaPengiriman!.map((x) => x.toJson())),
  };
}

class JasaPengiriman {
  String? layananId;
  String? layananHarga;
  String? layananName;
  String? layananHari;

  JasaPengiriman({
    this.layananId,
    this.layananHarga,
    this.layananName,
    this.layananHari,
  });

  factory JasaPengiriman.fromJson(Map<String, dynamic> json) => JasaPengiriman(
    layananId: json["layanan_id"],
    layananHarga: json["layanan_harga"],
    layananName: json["layanan_name"],
    layananHari: json["layanan_hari"],
  );

  Map<String, dynamic> toJson() => {
    "layanan_id": layananId,
    "layanan_harga": layananHarga,
    "layanan_name": layananName,
    "layanan_hari": layananHari,
  };
}

class ListKurir {
  String? kurirId;
  String? kurirKode;
  String? kurirName;

  ListKurir({
    this.kurirId,
    this.kurirKode,
    this.kurirName,
  });

  factory ListKurir.fromJson(Map<String, dynamic> json) => ListKurir(
    kurirId: json["kurir_id"],
    kurirKode: json["kurir_kode"],
    kurirName: json["kurir_name"],
  );

  Map<String, dynamic> toJson() => {
    "kurir_id": kurirId,
    "kurir_kode": kurirKode,
    "kurir_name": kurirName,
  };
}