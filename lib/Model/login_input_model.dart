class LoginInputModel {
  String? email;
  String? password;

  LoginInputModel({this.email, this.password});

  factory LoginInputModel.fromJson(Map<String, dynamic> json) => LoginInputModel(
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}