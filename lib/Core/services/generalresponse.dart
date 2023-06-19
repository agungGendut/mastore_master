class GeneralResponses {
  final code;
  final message;

  GeneralResponses({this.code, this.message});

  GeneralResponses.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        message = json['message'];

  Map<String, dynamic> toJson() => {"code": code, "message": message};
}
