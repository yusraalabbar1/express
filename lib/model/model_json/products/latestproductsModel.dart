//latestproductsModel
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

latestproductsModel welcomeFromJson(String str) =>
    latestproductsModel.fromJson(json.decode(str));

String welcomeToJson(latestproductsModel data) => json.encode(data.toJson());

class latestproductsModel {
  latestproductsModel({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  bool? status;
  String? code;
  String? message;
  List<Datum>? data;

  factory latestproductsModel.fromJson(Map<String, dynamic> json) =>
      latestproductsModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: json["data"] != null
            ? List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)))
            : null,
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
    this.name,
    this.desctiption,
    this.price,
    this.discount,
    this.images,
    this.addedToCart,
    this.quantityCart,
    this.addedToFavourites,
  });

  int? id;
  String? name;
  String? desctiption;
  String? price;
  String? discount;
  List<Image>? images;
  int? addedToCart;
  int? quantityCart;
  int? addedToFavourites;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        desctiption: json["desctiption"],
        price: json["price"],
        discount: json["discount"] == null ? null : json["discount"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        addedToCart: json["added_to_cart"] == ""
            ? 0
            : int.parse(json["added_to_cart"].toString()),
        quantityCart: json["quantity_cart"] == ""
            ? 0
            : int.parse(json["quantity_cart"].toString()),
        addedToFavourites:
            json["added_to_favourites"] == "" ? 0 : json["added_to_favourites"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "desctiption": desctiption,
        "price": price,
        "discount": discount == null ? null : discount,
        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
        "added_to_cart": addedToCart,
        "quantity_cart": quantityCart,
        "added_to_favourites": addedToFavourites,
      };
}

class Image {
  Image({
    this.id,
    this.image,
  });

  int? id;
  String? image;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}
