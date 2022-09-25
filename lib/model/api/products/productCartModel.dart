import 'dart:convert';

// ProductCategoryModel welcomeFromJson(String str) =>
//     ProductCategoryModel.fromJson(json.decode(str));

// String welcomeToJson(ProductCategoryModel data) => json.encode(data.toJson());
ProductCategoryModel ProductCategoryModelFromJson(String str) =>
    ProductCategoryModel.fromJson(json.decode(str));

String ProductCategoryModelDataToJson(ProductCategoryModel data) =>
    json.encode(data.toJson());

class ProductCategoryModel {
  ProductCategoryModel({
    this.status,
    this.code,
    this.message,
    this.data,
    this.meta,
  });

  bool? status;
  String? code;
  String? message;
  List<ProdCat>? data;
  MetaProCat? meta;

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) =>
      ProductCategoryModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: json["data"] != null
            ? List<ProdCat>.from(json["data"].map((x) => ProdCat.fromJson(x)))
            : null,
        meta: json["meta"] != null ? MetaProCat.fromJson(json["meta"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta!.toJson(),
      };
}

class ProdCat {
  ProdCat({
    this.id,
    this.name,
    this.desctiption,
    this.price,
    this.new_price,
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
  dynamic? new_price;
  dynamic? discount;

  List<Image>? images;
  int? addedToCart;
  int? quantityCart;
  int? addedToFavourites;

  factory ProdCat.fromJson(Map<String, dynamic> json) => ProdCat(
        id: json["id"],
        name: json["name"],
        desctiption: json["desctiption"],
        price: json["price"],
        new_price: json["new_price"],
        discount: json["discount"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        addedToCart: json["added_to_cart"] == "" ? 0 : json["added_to_cart"],
        quantityCart: json["quantity_cart"] == ""
            ? 0
            : int.parse(json["quantity_cart"].toString()),
        addedToFavourites:
            json["added_to_favourites"] == "" ? 0 : json["added_to_favourites"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "desctiption": desctiption,
        "price": price,
        "new_price": new_price,
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

class MetaProCat {
  MetaProCat({
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

  factory MetaProCat.fromJson(Map<String, dynamic> json) => MetaProCat(
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
