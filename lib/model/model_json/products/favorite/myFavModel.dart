// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

MyFavoritModel welcomeFromJson(String str) =>
    MyFavoritModel.fromJson(json.decode(str));

String welcomeToJson(MyFavoritModel data) => json.encode(data.toJson());

class MyFavoritModel {
  MyFavoritModel({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  bool? status;
  String? code;
  String? message;
  List<Datum>? data;

  factory MyFavoritModel.fromJson(Map<String, dynamic> json) => MyFavoritModel(
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
    this.product,
  });

  int? id;
  Product? product;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product": product!.toJson(),
      };
}

class Product {
  Product({
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
  int? price;
  int? discount;
  List<Image>? images;
  int? addedToCart;
  int? quantityCart;
  int? addedToFavourites;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        desctiption: json["desctiption"],
        price: json["price"],
        discount: json["discount"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        addedToCart: json["added_to_cart"],
        quantityCart: int.parse(json["quantity_cart"].toString()),
        addedToFavourites: json["added_to_favourites"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "desctiption": desctiption,
        "price": price,
        "discount": discount,
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
