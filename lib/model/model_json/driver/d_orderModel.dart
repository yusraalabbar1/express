// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);
//OrderModel
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

OrderModel welcomeFromJson(String str) => OrderModel.fromJson(json.decode(str));

String welcomeToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  bool? status;
  String? code;
  String? message;
  List<Datum>? data;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: json["data"] != null
            ? List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
