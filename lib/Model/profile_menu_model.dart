import 'dart:convert';

ProfileMenu profileMenuFromJson(String str) => ProfileMenu.fromJson(json.decode(str));

String profileMenuToJson(ProfileMenu data) => json.encode(data.toJson());

class ProfileMenu {
  bool? success;
  String? message;
  int? statusCode;
  ProfileMenuData? data;

  ProfileMenu({
    this.success,
    this.message,
    this.statusCode,
    this.data,
  });

  factory ProfileMenu.fromJson(Map<String, dynamic> json) => ProfileMenu(
    success: json["success"],
    message: json["message"],
    statusCode: json["status_code"],
    data: json["data"] == null ? null : ProfileMenuData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "status_code": statusCode,
    "data": data?.toJson(),
  };
}

class ProfileMenuData {
  DataProfileMenu? data;

  ProfileMenuData({
    this.data,
  });

  factory ProfileMenuData.fromJson(Map<String, dynamic> json) => ProfileMenuData(
    data: json["data"] == null ? null : DataProfileMenu.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class DataProfileMenu {
  List<ResultMenu>? results;

  DataProfileMenu({
    this.results,
  });

  factory DataProfileMenu.fromJson(Map<String, dynamic> json) => DataProfileMenu(
    results: json["results"] == null ? [] : List<ResultMenu>.from(json["results"]!.map((x) => ResultMenu.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class ResultMenu {
  int? id;
  String? tittle;

  ResultMenu({
    this.id,
    this.tittle,
  });

  factory ResultMenu.fromJson(Map<String, dynamic> json) => ResultMenu(
    id: json["id"],
    tittle: json["tittle"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tittle": tittle,
  };
}