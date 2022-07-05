//notificationModel
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

notificationModel welcomeFromJson(String str) =>
    notificationModel.fromJson(json.decode(str));

String welcomeToJson(notificationModel data) => json.encode(data.toJson());

class notificationModel {
  notificationModel({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  bool? status;
  String? code;
  String? message;
  List<Datum>? data;

  factory notificationModel.fromJson(Map<String, dynamic> json) =>
      notificationModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
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
    this.title,
    this.body,
    this.type,
    this.data,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? title;
  String? body;
  String? type;
  String? data;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        type: json["type"],
        data: json["data"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "type": type,
        "data": data,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
