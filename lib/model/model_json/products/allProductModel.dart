//AllProductModel
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class AllProductModel {
  AllProductModel({
    this.status,
    this.code,
    this.message,
    this.data,
    this.meta,
  });

  bool? status;
  String? code;
  String? message;
  List<Datum>? data;
  Meta? meta;

  factory AllProductModel.fromJson(Map<String, dynamic> json) =>
      AllProductModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta!.toJson(),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.desctiption,
    this.price,
    this.discount,
    this.newPrice,
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
  String? price;
  dynamic discount;
  int? newPrice;
  String? vendor2;
  List<Image>? images;
  List<Color>? sizes;
  List<Color>? colors;
  int? addedToCart;
  int? quantityCart;
  int? addedToFavourites;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        desctiption: json["desctiption"],
        price: json["price"],
        discount: json["discount"],
        newPrice: json["new_price"],
        vendor2: json["vendor_2"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        sizes: List<Color>.from(json["sizes"].map((x) => Color.fromJson(x))),
        colors: List<Color>.from(json["colors"].map((x) => Color.fromJson(x))),
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
        "new_price": newPrice,
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

class Meta {
  Meta({
    this.total,
    this.count,
    this.perPage,
    this.currentPage,
    this.totalPages,
  });

  int? total;
  int? count;
  int? perPage;
  int? currentPage;
  int? totalPages;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        total: json["total"],
        count: json["count"],
        perPage: json["per_page"],
        currentPage: json["current_page"],
        totalPages: json["total_pages"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "count": count,
        "per_page": perPage,
        "current_page": currentPage,
        "total_pages": totalPages,
      };
}
