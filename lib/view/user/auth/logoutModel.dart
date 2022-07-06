//logoutModel

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

logoutModel welcomeFromJson(String str) => logoutModel.fromJson(json.decode(str));

String welcomeToJson(logoutModel data) => json.encode(data.toJson());

class logoutModel {
    logoutModel({
        this.status,
        this.code,
        this.message,
        this.data,
    });

    bool? status;
    String? code;
    String? message;
    String? data;

    factory logoutModel.fromJson(Map<String, dynamic> json) => logoutModel(
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
