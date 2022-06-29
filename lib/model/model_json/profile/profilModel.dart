// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ProfilModel welcomeFromJson(String str) =>
    ProfilModel.fromJson(json.decode(str));

String welcomeToJson(ProfilModel data) => json.encode(data.toJson());

class ProfilModel {
  ProfilModel({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  bool? status;
  String? code;
  String? message;
  Data? data;

  factory ProfilModel.fromJson(Map<String, dynamic> json) => ProfilModel(
        status: json["status"],
        code: json["code"].toString(),
        message: json["message"],
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.photoProfile,
    this.city,
    this.area,
  });

  int? id;
  String? name;
  dynamic? email;
  String? mobile;
  String? photoProfile;
  dynamic? city;
  dynamic? area;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        photoProfile: json["photo_profile"],
        city: json["city"],
        area: json["area"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobile": mobile,
        "photo_profile": photoProfile,
        "city": city,
        "area": area,
      };
}
