// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

OrderOtherModel OrderOtherModelFromJson(String str) =>
    OrderOtherModel.fromJson(json.decode(str));

String welcomeToJson(OrderOtherModel data) => json.encode(data.toJson());

class OrderOtherModel {
  OrderOtherModel({
    this.status,
    this.code,
    this.message,
    this.data,
    this.meta,
  });

  bool? status;
  String? code;
  String? message;
  List<DatumOrderOtherModel>? data;
  Meta? meta;

  factory OrderOtherModel.fromJson(Map<String, dynamic> json) =>
      OrderOtherModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: List<DatumOrderOtherModel>.from(
            json["data"].map((x) => DatumOrderOtherModel.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta!.toJson(),
      };
}

class DatumOrderOtherModel {
  DatumOrderOtherModel({
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
    this.created_at,
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
  dynamic created_at;

  factory DatumOrderOtherModel.fromJson(Map<String, dynamic> json) =>
      DatumOrderOtherModel(
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
        created_at: json["created_at"],
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
        "created_at": created_at,
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

class Meta {
  Meta({
    this.total,
    this.count,
    this.perPage,
    this.currentPage,
    this.totalPages,
  });

  int? total;
  int? count;
  int? perPage;
  int? currentPage;
  int? totalPages;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        total: json["total"],
        count: json["count"],
        perPage: json["per_page"],
        currentPage: json["current_page"],
        totalPages: json["total_pages"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "count": count,
        "per_page": perPage,
        "current_page": currentPage,
        "total_pages": totalPages,
      };
}
