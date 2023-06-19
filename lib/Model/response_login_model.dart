class ResponseLoginModel {
  int? code;
  String? message;
  DataLogin? data;

  ResponseLoginModel({
    this.code,
    this.message,
    this.data,
  });

  factory ResponseLoginModel.fromJson(Map<String, dynamic> json) => ResponseLoginModel(
    code: json["code"],
    message: json["message"],
    data: json["data"]==null? null : DataLogin.fromJson(json["data"]),
  );
}

class DataLogin {
  String? userId;
  String? roleId;
  String? name;
  String? image;
  String? telephone;
  String? token;

  DataLogin({
    this.userId,
    this.roleId,
    this.name,
    this.image,
    this.telephone,
    this.token
  });

  factory DataLogin.fromJson(Map<String, dynamic> json) => DataLogin(
    userId: json["user_id"].toString(),
    roleId: json["user_id"].toString(),
    name: json["name"],
    image: json["image"],
    telephone: json["telephone"],
    token: json["api_token"],
  );
}