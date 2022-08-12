//notificationModel
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

// notificationModel notificationPassFromJson(String str) =>
//     notificationModel.fromJson(json.decode(str));

// String welcomeToJson(notificationModel data) => json.encode(data.toJson());
notificationModel notificationPassFromJson(String str) =>
    notificationModel.fromJson(json.decode(str));

String notificationPassDataToJson(notificationModel data) =>
    json.encode(data.toJson());

class notificationModel {
  notificationModel({
    this.status,
    this.code,
    this.message,
    this.data,
    this.meta,
  });

  bool? status;
  String? code;
  String? message;
  List<NotificationPass>? data;
  MetaNotif? meta;

  factory notificationModel.fromJson(Map<String, dynamic> json) =>
      notificationModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: List<NotificationPass>.from(
            json["data"].map((x) => NotificationPass.fromJson(x))),
        meta: json["meta"] != null ? MetaNotif.fromJson(json["meta"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta!.toJson(),
      };
}

class NotificationPass {
  NotificationPass({
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

  factory NotificationPass.fromJson(Map<String, dynamic> json) =>
      NotificationPass(
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

class MetaNotif {
  MetaNotif({
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

  factory MetaNotif.fromJson(Map<String, dynamic> json) => MetaNotif(
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
