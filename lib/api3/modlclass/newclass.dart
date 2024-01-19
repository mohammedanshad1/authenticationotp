// To parse this JSON data, do
//
//     final new = newFromJson(jsonString);

import 'dart:convert';

List<New> newFromJson(String str) => List<New>.from(json.decode(str).map((x) => New.fromJson(x)));

//String newToJson(List<New> data) => json.encode(List<dynamic>.from(data!.map((x) => x.toJson())));

class New {
  int? id;
  String? email;
  String? username;
  String? password;

  String? phone;
  int? v;

  New({

     this.id,
     this.email,
    this.username,
    this.password,

     this.phone,
    this.v,
  });

  factory New.fromJson(Map<String, dynamic> json) => New(
    id: json["id"],
    email: json["email"],
    username: json["username"],
    password: json["password"],

    phone: json["phone"],
    v: json["__v"],
  );


}
