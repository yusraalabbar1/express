// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

UpdateOrderModel welcomeFromJson(String str) =>
    UpdateOrderModel.fromJson(json.decode(str));

String welcomeToJson(UpdateOrderModel data) => json.encode(data.toJson());

class UpdateOrderModel {
  UpdateOrderModel({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  bool? status;
  String? code;
  String? message;
  Data? data;

  factory UpdateOrderModel.fromJson(Map<String, dynamic> json) =>
      UpdateOrderModel(
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
    this.code,
    this.userName,
    this.userMobile,
    this.userAddress,
    this.total,
    this.delivery,
    this.vendor,
    this.status,
  });

  int? id;
  String? code;
  String? userName;
  String? userMobile;
  String? userAddress;
  int? total;
  Delivery? delivery;
  Delivery? vendor;
  String? status;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        code: json["code"],
        userName: json["user_name"],
        userMobile: json["user_mobile"],
        userAddress: json["user_address"],
        total: json["total"],
        delivery: Delivery.fromJson(json["delivery"]),
        vendor: Delivery.fromJson(json["vendor"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "user_name": userName,
        "user_mobile": userMobile,
        "user_address": userAddress,
        "total": total,
        "delivery": delivery!.toJson(),
        "vendor": vendor!.toJson(),
        "status": status,
      };
}

class Delivery {
  Delivery({
    this.id,
    this.name,
    this.mobile,
    this.photoProfile,
  });

  int? id;
  String? name;
  String? mobile;
  String? photoProfile;

  factory Delivery.fromJson(Map<String, dynamic> json) => Delivery(
        id: json["id"],
        name: json["name"],
        mobile: json["mobile"],
        photoProfile: json["photo_profile"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "mobile": mobile,
        "photo_profile": photoProfile,
      };
}
