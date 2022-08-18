// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

productDetailsModel welcomeFromJson(String str) =>
    productDetailsModel.fromJson(json.decode(str));

String welcomeToJson(productDetailsModel data) => json.encode(data.toJson());

class productDetailsModel {
  productDetailsModel({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  bool? status;
  String? code;
  String? message;
  Data? data;

  factory productDetailsModel.fromJson(Map<String, dynamic> json) =>
      productDetailsModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
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
    this.name,
    this.desctiption,
    this.price,
    this.discount,
    this.vendor2,
    this.images,
    this.sizes,
    this.colors,
    this.addedToCart,
    this.quantityCart,
    this.addedToFavourites,
  });

  int? id;
  String? name;
  String? desctiption;
  dynamic? price;
  dynamic discount;
  dynamic vendor2;
  List<Image>? images;
  List<Color>? sizes;
  List<Color>? colors;
  dynamic? addedToCart;
  dynamic? quantityCart;
  dynamic? addedToFavourites;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        desctiption: json["desctiption"],
        price: json["price"],
        discount: json["discount"],
        vendor2: json["vendor_2"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        sizes: List<Color>.from(json["sizes"].map((x) => Color.fromJson(x))),
        colors: List<Color>.from(json["colors"].map((x) => Color.fromJson(x))),
        addedToCart: json["added_to_cart"].toString() == ""
            ? 0
            : int.parse(json["added_to_cart"].toString()),
        quantityCart: json["quantity_cart"].toString() == ""
            ? 0
            : int.parse(json["quantity_cart"].toString()),
        addedToFavourites: json["added_to_favourites"].toString() == ""
            ? 0
            : int.parse(json["added_to_favourites"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "desctiption": desctiption,
        "price": price,
        "discount": discount,
        "vendor_2": vendor2,
        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
        "sizes": List<dynamic>.from(sizes!.map((x) => x.toJson())),
        "colors": List<dynamic>.from(colors!.map((x) => x.toJson())),
        "added_to_cart": addedToCart,
        "quantity_cart": quantityCart,
        "added_to_favourites": addedToFavourites,
      };
}

class Color {
  Color({
    this.id,
    this.color,
    this.productId,
    this.createdAt,
    this.updatedAt,
    this.size,
  });

  int? id;
  String? color;
  int? productId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? size;

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        id: json["id"],
        color: json["color"] == null ? null : json["color"],
        productId: json["product_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        size: json["size"] == null ? null : json["size"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "color": color == null ? null : color,
        "product_id": productId,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "size": size == null ? null : size,
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
