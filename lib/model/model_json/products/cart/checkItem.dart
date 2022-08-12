// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CheckItemModel welcomeFromJson(String str) =>
    CheckItemModel.fromJson(json.decode(str));

String welcomeToJson(CheckItemModel data) => json.encode(data.toJson());

class CheckItemModel {
  CheckItemModel({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  bool? status;
  String? code;
  String? message;
  Data? data;

  factory CheckItemModel.fromJson(Map<String, dynamic> json) => CheckItemModel(
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
    this.product,
    this.quantity,
    this.isChecked,
    this.extras,
  });

  int? id;
  Product? product;
  String? quantity;
  String? isChecked;
  List<dynamic>? extras;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        product: Product.fromJson(json["product"]),
        quantity: json["quantity"],
        isChecked: json["is_checked"],
        extras: List<dynamic>.from(json["extras"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product": product!.toJson(),
        "quantity": quantity,
        "is_checked": isChecked,
        "extras": List<dynamic>.from(extras!.map((x) => x)),
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
  String? quantityCart;
  int? addedToFavourites;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        desctiption: json["desctiption"],
        price: json["price"],
        discount: json["discount"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        addedToCart: json["added_to_cart"],
        quantityCart: json["quantity_cart"],
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
