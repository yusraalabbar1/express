// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

SearchModel SearchModelwelcomeFromJson(String str) =>
    SearchModel.fromJson(json.decode(str));

String welcomeToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  SearchModel({
    this.status,
    this.code,
    this.message,
    this.data,
    this.meta,
  });

  bool? status;
  String? code;
  String? message;
  List<searchProu>? data;
  MetaSearch? meta;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: json["data"] != null
            ? List<searchProu>.from(
                json["data"].map((x) => searchProu.fromJson(x)))
            : null,
        meta: json["meta"] != null ? MetaSearch.fromJson(json["meta"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta!.toJson(),
      };
}

class searchProu {
  searchProu({
    this.id,
    this.name,
    this.desctiption,
    this.price,
    this.discount,
    this.new_price,
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
  dynamic? new_price;
  List<Image>? images;
  dynamic? addedToCart;
  dynamic? quantityCart;
  dynamic? addedToFavourites;

  factory searchProu.fromJson(Map<String, dynamic> json) => searchProu(
        id: json["id"],
        name: json["name"],
        desctiption: json["desctiption"],
        price: json["price"],
        discount: json["discount"],
        new_price: json["new_price"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        addedToCart: json["added_to_cart"] == "" ? 0 : json["added_to_cart"],
        quantityCart: json["quantity_cart"] == "" ? 0 : json["quantity_cart"],
        addedToFavourites:
            json["added_to_favourites"] == "" ? 0 : json["added_to_favourites"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "desctiption": desctiption,
        "price": price,
        "discount": discount,
        "new_price": new_price,
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

class MetaSearch {
  MetaSearch({
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

  factory MetaSearch.fromJson(Map<String, dynamic> json) => MetaSearch(
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
