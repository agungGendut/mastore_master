import 'dart:convert';

List<CategorysWrapper> categorysWrapperFromJson(String str) => List<CategorysWrapper>.from(json.decode(str).map((x) => CategorysWrapper.fromJson(x)));

String categorysWrapperToJson(List<CategorysWrapper> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategorysWrapper {
  CategorysWrapper({
    this.katId,
    this.katName,
    this.katImage,
    this.katIcon,
    this.katUrut,
  });

  int? katId;
  String? katName;
  String? katImage;
  String? katIcon;
  int? katUrut;

  factory CategorysWrapper.fromJson(Map<String, dynamic> json) => CategorysWrapper(
    katId: json["kat_id"],
    katName: json["kat_name"],
    katImage: json["kat_image"],
    katIcon: json["kat_icon"],
    katUrut: json["kat_urut"],
  );

  Map<String, dynamic> toJson() => {
    "kat_id": katId,
    "kat_name": katName,
    "kat_image": katImage,
    "kat_icon": katIcon,
    "kat_urut": katUrut,
  };
}