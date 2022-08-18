import 'dart:convert';

// MyOrderModel passOrderFromJson(String str) =>
//     MyOrderModel.fromJson(json.decode(str));

// String welcomeToJson(MyOrderModel data) => json.encode(data.toJson());

MyOrderModel passOrderFromJson(String str) =>
    MyOrderModel.fromJson(json.decode(str));

String passOrdersDataToJson(MyOrderModel data) => json.encode(data.toJson());

class MyOrderModel {
  MyOrderModel({
    this.status,
    this.code,
    this.message,
    this.data,
    this.meta,
  });

  bool? status;
  String? code;
  String? message;
  List<passOrder>? data;
  MetaOrder? meta;

  factory MyOrderModel.fromJson(Map<String, dynamic> json) => MyOrderModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: json["data"] != null
            ? List<passOrder>.from(
                json["data"].map((x) => passOrder.fromJson(x)))
            : null,
        meta: json["meta"] != null ? MetaOrder.fromJson(json["meta"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta!.toJson(),
      };
}

class passOrder {
  passOrder({
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
  dynamic? total;
  dynamic? deliveryCost;
  dynamic? finalTotal;
  String? dropAddress;
  String? status;
  List<Item>? items;
  DateTime? createdAt;

  factory passOrder.fromJson(Map<String, dynamic> json) => passOrder(
        id: json["id"],
        total: json["total"],
        deliveryCost: json["delivery_cost"],
        finalTotal: json["final_total"],
        dropAddress: json["drop_address"],
        status: json["status"],
        items: json["items"] != null
            ? List<Item>.from(json["items"].map((x) => Item.fromJson(x)))
            : null,
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
  dynamic? total;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        product:
            json["product"] != null ? Product.fromJson(json["product"]) : null,
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
  dynamic? price;
  dynamic? discount;
  List<Image>? images;
  dynamic? addedToCart;
  dynamic? quantityCart;
  dynamic? addedToFavourites;

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

class MetaOrder {
  MetaOrder({
    this.total,
    this.final_total,
    this.count,
    this.perPage,
    this.currentPage,
    this.totalPages,
  });

  int? total;
  int? final_total;
  int? count;
  int? perPage;
  int? currentPage;
  int? totalPages;

  factory MetaOrder.fromJson(Map<String, dynamic> json) => MetaOrder(
        total: json["total"],
        final_total: json["final_total"],
        count: json["count"],
        perPage: json["per_page"],
        currentPage: json["current_page"],
        totalPages: json["total_pages"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "final_total": final_total,
        "count": count,
        "per_page": perPage,
        "current_page": currentPage,
        "total_pages": totalPages,
      };
}
