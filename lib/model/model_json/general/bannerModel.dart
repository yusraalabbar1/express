import 'dart:convert';

BannerModel welcomeFromJson(String str) =>
    BannerModel.fromJson(json.decode(str));

String welcomeToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  BannerModel({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  bool? status;
  String? code;
  String? message;
  List<Datum>? data;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
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
    this.type,
    this.target,
    this.image,
  });

  int? id;
  String? type;
  dynamic? target;
  String? image;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        type: json["type"],
        target: json["target"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "target": target,
        "image": image,
      };
}

class TargetClass {
  TargetClass({
    this.id,
    this.name,
    this.image,
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
  String? image;
  String? desctiption;
  String? price;
  String? discount;
  List<Image>? images;
  int? addedToCart;
  int? quantityCart;
  int? addedToFavourites;

  factory TargetClass.fromJson(Map<String, dynamic> json) => TargetClass(
        id: json["id"],
        name: json["name"],
        image: json["image"] == null ? null : json["image"],
        desctiption: json["desctiption"] == null ? null : json["desctiption"],
        price: json["price"] == null ? null : json["price"],
        discount: json["discount"] == null ? null : json["discount"],
        images: json["images"] == null
            ? null
            : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        addedToCart:
            json["added_to_cart"] == null ? null : json["added_to_cart"],
        quantityCart:
            json["quantity_cart"] == null ? null : json["quantity_cart"],
        addedToFavourites: json["added_to_favourites"] == null
            ? null
            : json["added_to_favourites"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image == null ? null : image,
        "desctiption": desctiption == null ? null : desctiption,
        "price": price == null ? null : price,
        "discount": discount == null ? null : discount,
        "images": images == null
            ? null
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "added_to_cart": addedToCart == null ? null : addedToCart,
        "quantity_cart": quantityCart == null ? null : quantityCart,
        "added_to_favourites":
            addedToFavourites == null ? null : addedToFavourites,
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
