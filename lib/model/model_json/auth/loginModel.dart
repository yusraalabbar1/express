import 'dart:convert';

LoginModel welcomeFromJson(String str) => LoginModel.fromJson(json.decode(str));

String welcomeToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  bool? status;
  String? code;
  String? message;
  Data? data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
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
    this.user,
  });

  User? user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user!.toJson(),
      };
}

class User {
  User({
    this.id,
    this.name,
    this.mobile,
    this.photoProfile,
    this.city,
    this.area,
    this.deviceType,
    this.fcmToken,
    this.accessToken,
  });

  int? id;
  String? name;
  String? mobile;
  String? photoProfile;
  dynamic city;
  dynamic area;
  String? deviceType;
  String? fcmToken;
  String? accessToken;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        mobile: json["mobile"],
        photoProfile: json["photo_profile"],
        city: json["city"],
        area: json["area"],
        deviceType: json["device_type"],
        fcmToken: json["fcm_token"],
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "mobile": mobile,
        "photo_profile": photoProfile,
        "city": city,
        "area": area,
        "device_type": deviceType,
        "fcm_token": fcmToken,
        "access_token": accessToken,
      };
}
