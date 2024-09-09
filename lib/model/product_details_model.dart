// To parse this JSON data, do
//
//     final productDetailsModel = productDetailsModelFromJson(jsonString);

import 'dart:convert';

ProductDetailsModel productDetailsModelFromJson(String str) =>
    ProductDetailsModel.fromJson(json.decode(str));

String productDetailsModelToJson(ProductDetailsModel data) =>
    json.encode(data.toJson());

class ProductDetailsModel {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  ProductRating rating;

  ProductDetailsModel({
    this.id = 0,
    this.title = "",
    this.price = 0.0,
    this.description = "",
    this.category = "",
    this.image = "",
    required this.rating,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: ProductRating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating.toJson(),
      };
}

class ProductRating {
  double rate;
  int count;

  ProductRating({
    this.rate = 0.0,
    this.count = 0,
  });

  factory ProductRating.fromJson(Map<String, dynamic> json) => ProductRating(
        rate: json["rate"].toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}
