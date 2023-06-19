import 'dart:convert';

SignUpWrapper signUpWrapperFromJson(String str) => SignUpWrapper.fromJson(json.decode(str));

String signUpWrapperToJson(SignUpWrapper data) => json.encode(data.toJson());

class SignUpWrapper {
  SignUpWrapper({
    this.responseStatus,
    this.responseMessage,
    this.data,
  });

  String? responseStatus;
  String? responseMessage;
  Data? data;

  factory SignUpWrapper.fromJson(Map<String, dynamic> json) => SignUpWrapper(
    responseStatus: json["response_status"],
    responseMessage: json["response_message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "response_status": responseStatus,
    "response_message": responseMessage,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.idUser,
  });

  String? idUser;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    idUser: json["id_user"],
  );

  Map<String, dynamic> toJson() => {
    "id_user": idUser,
  };
}