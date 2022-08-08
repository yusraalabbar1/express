//MyCartModel
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class MyCartModel {
  MyCartModel({
    this.status,
    this.code,
    this.message,
    this.data,
    this.cartTotal,
    this.deliveryFees,
  });

  bool? status;
  String? code;
  String? message;
  List<Datum>? data;
  int? cartTotal;
  int? deliveryFees;

  factory MyCartModel.fromJson(Map<String, dynamic> json) => MyCartModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        cartTotal: json["cart_total"],
        deliveryFees: json["delivery_fees"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "cart_total": cartTotal,
        "delivery_fees": deliveryFees,
      };
}

class Datum {
  Datum({
    this.id,
    this.product,
    this.quantity,
    this.size,
    this.color,
    this.isChecked,
    this.extras,
  });

  int? id;
  Product? product;
  String? quantity;
  String? size;
  String? color;
  int? isChecked;
  List<dynamic>? extras;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        product: Product.fromJson(json["product"]),
        quantity: json["quantity"],
        size: json["size"],
        color: json["color"],
        isChecked: json["is_checked"],
        extras: List<dynamic>.from(json["extras"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product": product!.toJson(),
        "quantity": quantity,
        "size": size,
        "color": color,
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
  dynamic? discount;
  String? vendor2;
  List<Image>? images;
  List<Color>? sizes;
  List<Color>? colors;
  int? addedToCart;
  String? quantityCart;
  int? addedToFavourites;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        desctiption: json["desctiption"],
        price: json["price"],
        discount: json["discount"],
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
