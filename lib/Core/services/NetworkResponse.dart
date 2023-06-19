class NetworkResponse {
  String? message;
  Data? result;
  String? status;

  NetworkResponse({
    this.message,
    this.result,
    this.status,
  });

  factory NetworkResponse.fromJson(Map<String, dynamic> json) => NetworkResponse(
    message: json["message"],
    result: Data.fromJson(json["result"]),
    status: json["status"],
  );
}

class NetworkResponse1 {
  String? statusMsg;
  Data? result;
  String? statusCode;

  NetworkResponse1({
    this.statusMsg,
    this.result,
    this.statusCode,
  });

  factory NetworkResponse1.fromJson(Map<String, dynamic> json) => NetworkResponse1(
    statusMsg: json["statusMsg"],
    result: Data.fromJson(json["result"]),
    statusCode: json["statusCode"],
  );
}

class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => Data();

  Map<String, dynamic> toJson() => {};
}
