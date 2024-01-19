// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

//String userToJson(User data) => json.encode(data.toJson());

class User {
  List<use>?data;

  User({
    required this.data,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    data: List<use>.from(json["data"].map((x) => use.fromJson(x))),
  );


}

class use {
  int id;
  String ? name;
  String ? email;
  String ? profession;

  use({
    required this.id,
    required this.name,
    required this.email,
    required this.profession,
  });

  factory use.fromJson(Map<String, dynamic> json) => use(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    profession: json["profession"],
  );


}
