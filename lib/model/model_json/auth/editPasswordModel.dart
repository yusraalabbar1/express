// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

EditPasswordModel welcomeFromJson(String str) =>
    EditPasswordModel.fromJson(json.decode(str));

String welcomeToJson(EditPasswordModel data) => json.encode(data.toJson());

class EditPasswordModel {
  EditPasswordModel({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  bool? status;
  String? code;
  String? message;
  String? data;

  factory EditPasswordModel.fromJson(Map<String, dynamic> json) =>
      EditPasswordModel(
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
