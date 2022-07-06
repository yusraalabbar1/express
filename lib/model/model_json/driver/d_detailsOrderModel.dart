//detailsOrderModel
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);
//detailsOrderModel
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

detailsOrderModel welcomeFromJson(String str) =>
    detailsOrderModel.fromJson(json.decode(str));

String welcomeToJson(detailsOrderModel data) => json.encode(data.toJson());

class detailsOrderModel {
  detailsOrderModel({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  bool? status;
  String? code;
  String? message;
  Data? data;

  factory detailsOrderModel.fromJson(Map<String, dynamic> json) =>
      detailsOrderModel(
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
    this.id,
    this.code,
    this.userName,
    this.userMobile,
    this.userAddress,
    this.total,
    this.delivery,
    this.vendor,
    this.status,
    this.notes,
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
  dynamic? notes;

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
        notes: json["notes"],
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
        "notes": notes,
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
