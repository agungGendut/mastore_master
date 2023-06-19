import 'dart:convert';

AddressWrapper addressWrapperFromJson(String str) => AddressWrapper.fromJson(json.decode(str));

String addressWrapperToJson(AddressWrapper data) => json.encode(data.toJson());

class AddressWrapper {
  DataAlamat? data;

  AddressWrapper({
    this.data,
  });

  factory AddressWrapper.fromJson(Map<String, dynamic> json) => AddressWrapper(
    data: json["data"] == null ? null : DataAlamat.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class DataAlamat {
  List<Province>? province;
  List<Kabupaten>? kabupaten;
  List<Kecamatan>? kecamatan;

  DataAlamat({
    this.province,
    this.kabupaten,
    this.kecamatan,
  });

  factory DataAlamat.fromJson(Map<String, dynamic> json) => DataAlamat(
    province: json["province"] == null ? [] : List<Province>.from(json["province"]!.map((x) => Province.fromJson(x))),
    kabupaten: json["Kabupaten"] == null ? [] : List<Kabupaten>.from(json["Kabupaten"]!.map((x) => Kabupaten.fromJson(x))),
    kecamatan: json["Kecamatan"] == null ? [] : List<Kecamatan>.from(json["Kecamatan"]!.map((x) => Kecamatan.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "province": province == null ? [] : List<dynamic>.from(province!.map((x) => x.toJson())),
    "Kabupaten": kabupaten == null ? [] : List<dynamic>.from(kabupaten!.map((x) => x.toJson())),
    "Kecamatan": kecamatan == null ? [] : List<dynamic>.from(kecamatan!.map((x) => x.toJson())),
  };
}

class Province {
  String? idProv;
  String? provName;

  Province({
    this.idProv,
    this.provName,
  });

  factory Province.fromJson(Map<String, dynamic> json) => Province(
    idProv: json["id_prov"],
    provName: json["prov_name"],
  );

  Map<String, dynamic> toJson() => {
    "id_prov": idProv,
    "prov_name": provName,
  };
}

class Kabupaten {
  String? kokabId;
  String? kokabName;

  Kabupaten({
    this.kokabId,
    this.kokabName,
  });

  factory Kabupaten.fromJson(Map<String, dynamic> json) => Kabupaten(
    kokabId: json["kokab_id"],
    kokabName: json["kokab_name"],
  );

  Map<String, dynamic> toJson() => {
    "kokab_id": kokabId,
    "kokab_name": kokabName,
  };
}

class Kecamatan {
  String? kecId;
  String? kecName;

  Kecamatan({
    this.kecId,
    this.kecName,
  });

  factory Kecamatan.fromJson(Map<String, dynamic> json) => Kecamatan(
    kecId: json["kec_id"],
    kecName: json["kec_name"],
  );

  Map<String, dynamic> toJson() => {
    "kec_id": kecId,
    "kec_name": kecName,
  };
}