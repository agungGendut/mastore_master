import 'dart:convert';

ProdukWrapper produkWrapperFromJson(String str) => ProdukWrapper.fromJson(json.decode(str));

String produkWrapperToJson(ProdukWrapper data) => json.encode(data.toJson());

class ProdukWrapper {
  ProdukWrapper({
    this.success,
    this.message,
    this.statusCode,
    this.data,
  });

  bool? success;
  String? message;
  int? statusCode;
  ProdukWrapperData? data;

  factory ProdukWrapper.fromJson(Map<String, dynamic> json) => ProdukWrapper(
    success: json["success"],
    message: json["message"],
    statusCode: json["status_code"],
    data: json["data"] == null ? null : ProdukWrapperData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "status_code": statusCode,
    "data": data?.toJson(),
  };
}

class ProdukWrapperData {
  ProdukWrapperData({
    this.data,
  });

  DataData? data;

  factory ProdukWrapperData.fromJson(Map<String, dynamic> json) => ProdukWrapperData(
    data: json["data"] == null ? null : DataData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class DataData {
  DataData({
    this.results,
  });

  Results? results;

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
    results: json["results"] == null ? null : Results.fromJson(json["results"]),
  );

  Map<String, dynamic> toJson() => {
    "results": results?.toJson(),
  };
}

class Results {
  Results({
    this.id,
    this.tittle,
    this.items,
  });

  int? id;
  String? tittle;
  Items? items;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    id: json["id"],
    tittle: json["tittle"],
    items: json["items"] == null ? null : Items.fromJson(json["items"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tittle": tittle,
    "items": items?.toJson(),
  };
}

class Items {
  Items({
    this.id,
    this.picture,
    this.title,
    this.description,
    this.price,
  });

  int? id;
  String? picture;
  String? title;
  String? description;
  String? price;

  factory Items.fromJson(Map<String, dynamic> json) => Items(
    id: json["id"],
    picture: json["picture"],
    title: json["title"],
    description: json["description"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "picture": picture,
    "title": title,
    "description": description,
    "price": price,
  };
}