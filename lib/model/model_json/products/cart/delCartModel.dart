// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

DelCartModel welcomeFromJson(String str) =>
    DelCartModel.fromJson(json.decode(str));

String welcomeToJson(DelCartModel data) => json.encode(data.toJson());

class DelCartModel {
  DelCartModel({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  bool? status;
  String? code;
  String? message;
  String? data;

  factory DelCartModel.fromJson(Map<String, dynamic> json) => DelCartModel(
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
