// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

DetailsOrderModel welcomeFromJson(String str) =>
    DetailsOrderModel.fromJson(json.decode(str));

String welcomeToJson(DetailsOrderModel data) => json.encode(data.toJson());

class DetailsOrderModel {
  DetailsOrderModel({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  bool? status;
  String? code;
  String? message;
  Data? data;

  factory DetailsOrderModel.fromJson(Map<String, dynamic> json) =>
      DetailsOrderModel(
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
    this.total,
    this.deliveryCost,
    this.finalTotal,
    this.dropAddress,
    this.status,
    this.createdat,
    this.items,
  });

  int? id;
  dynamic? total;
  dynamic? deliveryCost;
  dynamic? finalTotal;
  String? dropAddress;
  String? status;
  String? createdat;
  List<dynamic>? items;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        total: json["total"],
        deliveryCost: json["delivery_cost"],
        finalTotal: json["final_total"],
        dropAddress: json["drop_address"],
        status: json["status"],
        createdat: json["created_at"],
        items: List<dynamic>.from(json["items"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "total": total,
        "delivery_cost": deliveryCost,
        "final_total": finalTotal,
        "drop_address": dropAddress,
        "status": status,
        "created_at": createdat,
        "items": List<dynamic>.from(items!.map((x) => x)),
      };
}
