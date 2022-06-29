// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

forgetModel welcomeFromJson(String str) =>
    forgetModel.fromJson(json.decode(str));

String welcomeToJson(forgetModel data) => json.encode(data.toJson());

class forgetModel {
  forgetModel({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  bool? status;
  String? code;
  String? message;
  String? data;

  factory forgetModel.fromJson(Map<String, dynamic> json) => forgetModel(
        status: json["status"],
        code: json["code"].toString(),
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
