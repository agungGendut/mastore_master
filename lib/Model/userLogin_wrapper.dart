import 'dart:convert';

UserLoginWrapper userLoginWrapperFromJson(String str) => UserLoginWrapper.fromJson(json.decode(str));

String userLoginWrapperToJson(UserLoginWrapper data) => json.encode(data.toJson());

class UserLoginWrapper {
  UserLoginWrapper({
    this.responseStatus,
    this.responseMessage,
    this.data,
  });

  String? responseStatus;
  String? responseMessage;
  UserData? data;

  factory UserLoginWrapper.fromJson(Map<String, dynamic> json) => UserLoginWrapper(
    responseStatus: json["response_status"],
    responseMessage: json["response_message"],
    data: json["data"] == null ? null : UserData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "response_status": responseStatus,
    "response_message": responseMessage,
    "data": data?.toJson(),
  };
}

class UserData {
  UserData({
    this.idUser,
    this.username,
    this.namaUser,
    this.emailUser,
    this.alamat,
    this.idKecamatan,
    this.idKota,
    this.idProv,
    this.fotoUser,
    this.handphone,
    this.hapeAdminMastore,
    this.level,
  });

  String? idUser;
  String? username;
  String? namaUser;
  String? emailUser;
  String? alamat;
  String? idKecamatan;
  String? idKota;
  String? idProv;
  String? fotoUser;
  String? handphone;
  String? hapeAdminMastore;
  String? level;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    idUser: json["id_user"],
    username: json["username"],
    namaUser: json["nama_user"],
    emailUser: json["email_user"],
    alamat: json["alamat"],
    idKecamatan: json["id_kecamatan"],
    idKota: json["id_kota"],
    idProv: json["id_prov"],
    fotoUser: json["foto_user"],
    handphone: json["handphone"],
    hapeAdminMastore: json["hape_admin_mastore"],
    level: json["level"],
  );

  Map<String, dynamic> toJson() => {
    "id_user": idUser,
    "username": username,
    "nama_user": namaUser,
    "email_user": emailUser,
    "alamat": alamat,
    "id_kecamatan": idKecamatan,
    "id_kota": idKota,
    "id_prov": idProv,
    "foto_user": fotoUser,
    "handphone": handphone,
    "hape_admin_mastore": hapeAdminMastore,
    "level": level,
  };
}