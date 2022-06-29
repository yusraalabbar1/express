//placeOrderModel
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

placeOrderModel welcomeFromJson(String str) =>
    placeOrderModel.fromJson(json.decode(str));

String welcomeToJson(placeOrderModel data) => json.encode(data.toJson());

class placeOrderModel {
  placeOrderModel({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  bool? status;
  String? code;
  String? message;
  Data? data;

  factory placeOrderModel.fromJson(Map<String, dynamic> json) =>
      placeOrderModel(
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
    this.total,
    this.deliveryCost,
    this.finalTotal,
    this.dropAddress,
    this.status,
    this.items,
    this.createdAt,
  });

  int? id;
  int? total;
  dynamic? deliveryCost;
  int? finalTotal;
  String? dropAddress;
  dynamic? status;
  List<Item>? items;
  DateTime? createdAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        total: json["total"],
        deliveryCost: json["delivery_cost"],
        finalTotal: json["final_total"],
        dropAddress: json["drop_address"],
        status: json["status"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "total": total,
        "delivery_cost": deliveryCost,
        "final_total": finalTotal,
        "drop_address": dropAddress,
        "status": status,
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
        "created_at": createdAt!.toIso8601String(),
      };
}

class Item {
  Item({
    this.id,
    this.product,
    this.quantity,
    this.total,
  });

  int? id;
  Product? product;
  int? quantity;
  int? total;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        product: Product.fromJson(json["product"]),
        quantity: json["quantity"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product": product!.toJson(),
        "quantity": quantity,
        "total": total,
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
  String? price;
  String? discount;
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
