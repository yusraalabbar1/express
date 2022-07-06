// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

VendLoginModel welcomeFromJson(String str) =>
    VendLoginModel.fromJson(json.decode(str));

String welcomeToJson(VendLoginModel data) => json.encode(data.toJson());

class VendLoginModel {
  VendLoginModel({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  bool? status;
  String? code;
  String? message;
  Data? data;

  factory VendLoginModel.fromJson(Map<String, dynamic> json) => VendLoginModel(
        status: json["status"],
        code: json["code"],
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
    this.user,
  });

  User? user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user!.toJson(),
      };
}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.photoProfile,
    this.deviceType,
    this.fcmToken,
    this.accessToken,
  });

  int? id;
  String? name;
  dynamic? email;
  String? mobile;
  String? photoProfile;
  String? deviceType;
  String? fcmToken;
  String? accessToken;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        photoProfile: json["photo_profile"],
        deviceType: json["device_type"],
        fcmToken: json["fcm_token"],
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobile": mobile,
        "photo_profile": photoProfile,
        "device_type": deviceType,
        "fcm_token": fcmToken,
        "access_token": accessToken,
      };
}
