// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

AddCartModel welcomeFromJson(String str) =>
    AddCartModel.fromJson(json.decode(str));

String welcomeToJson(AddCartModel data) => json.encode(data.toJson());

class AddCartModel {
  AddCartModel({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  bool? status;
  String? code;
  String? message;
  String? data;

  factory AddCartModel.fromJson(Map<String, dynamic> json) => AddCartModel(
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
