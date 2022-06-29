// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

delFavModel welcomeFromJson(String str) =>
    delFavModel.fromJson(json.decode(str));

String welcomeToJson(delFavModel data) => json.encode(data.toJson());

class delFavModel {
  delFavModel({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  bool? status;
  String? code;
  String? message;
  String? data;

  factory delFavModel.fromJson(Map<String, dynamic> json) => delFavModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "data": data,
      };
}
