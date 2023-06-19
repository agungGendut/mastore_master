import 'dart:convert';

MenuWrapper menuWrapperFromJson(String str) => MenuWrapper.fromJson(json.decode(str));

String menuWrapperToJson(MenuWrapper data) => json.encode(data.toJson());

class MenuWrapper {
  MenuWrapper({
    this.success,
    this.message,
    this.statusCode,
    this.data,
  });

  bool? success;
  String? message;
  int? statusCode;
  MenuWrapperData? data;

  factory MenuWrapper.fromJson(Map<String, dynamic> json) => MenuWrapper(
    success: json["success"],
    message: json["message"],
    statusCode: json["status_code"],
    data: json["data"] == null ? null : MenuWrapperData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "status_code": statusCode,
    "data": data?.toJson(),
  };
}

class MenuWrapperData {
  MenuWrapperData({
    this.data,
  });

  DataData? data;

  factory MenuWrapperData.fromJson(Map<String, dynamic> json) => MenuWrapperData(
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

  List<Result>? results;

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
    results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.id,
    this.tittle,
    this.items,
  });

  int? id;
  String? tittle;
  List<Item>? items;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    tittle: json["tittle"],
    items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tittle": tittle,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    this.id,
    this.picture,
    this.title,
    this.subtitle,
    this.description,
    this.price,
  });

  int? id;
  String? picture;
  String? title;
  String? subtitle;
  String? description;
  String? price;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    picture: json["picture"],
    title: json["title"],
    subtitle: json["subtitle"],
    description: json["description"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "picture": picture,
    "title": title,
    "subtitle": subtitle,
    "description": description,
    "price": price,
  };
}