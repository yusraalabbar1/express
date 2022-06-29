import 'dart:convert';

MyCartModel welcomeFromJson(String str) =>
    MyCartModel.fromJson(json.decode(str));

String welcomeToJson(MyCartModel data) => json.encode(data.toJson());

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
        data: json["data"] != null
            ? List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)))
            : null,
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
    this.isChecked,
    this.extras,
  });

  int? id;
  Product? product;
  String? quantity;
  int? isChecked;
  List<dynamic>? extras;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
  String? price;
  String? discount;
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
