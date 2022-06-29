// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

SettingModel welcomeFromJson(String str) =>
    SettingModel.fromJson(json.decode(str));

String welcomeToJson(SettingModel data) => json.encode(data.toJson());

class SettingModel {
  SettingModel({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  bool? status;
  String? code;
  String? message;
  Data? data;

  factory SettingModel.fromJson(Map<String, dynamic> json) => SettingModel(
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
    this.sitename,
    this.aboutApp,
    this.appTerms,
    this.appPolicy,
    this.contactUs,
  });

  int? id;
  String? sitename;
  String? aboutApp;
  String? appTerms;
  String? appPolicy;
  ContactUs? contactUs;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        sitename: json["sitename"],
        aboutApp: json["about_app"],
        appTerms: json["app_terms"],
        appPolicy: json["app_policy"],
        contactUs: json["contact_us"] != null
            ? ContactUs.fromJson(json["contact_us"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sitename": sitename,
        "about_app": aboutApp,
        "app_terms": appTerms,
        "app_policy": appPolicy,
        "contact_us": contactUs!.toJson(),
      };
}

class ContactUs {
  ContactUs({
    this.mobile,
    this.whatsapp,
    this.facebookLink,
    this.instagramLink,
  });

  String? mobile;
  String? whatsapp;
  String? facebookLink;
  String? instagramLink;

  factory ContactUs.fromJson(Map<String, dynamic> json) => ContactUs(
        mobile: json["mobile"],
        whatsapp: json["whatsapp"],
        facebookLink: json["facebook_link"],
        instagramLink: json["instagram_link"],
      );

  Map<String, dynamic> toJson() => {
        "mobile": mobile,
        "whatsapp": whatsapp,
        "facebook_link": facebookLink,
        "instagram_link": instagramLink,
      };
}
