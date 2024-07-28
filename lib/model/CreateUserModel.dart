import 'dart:convert';

class CreateUserModel {
  String name;
  String email;

  CreateUserModel({
    required this.name,
    required this.email,
  });

  factory CreateUserModel.fromRawJson(String str) => CreateUserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreateUserModel.fromJson(Map<String, dynamic> json) => CreateUserModel(
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
  };
}
