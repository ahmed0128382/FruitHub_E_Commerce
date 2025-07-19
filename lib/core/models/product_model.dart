import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/models/review_model.dart';

class ProductModel {
  final String name;
  final String description;
  final num price;
  final dynamic image;
  final String code;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int noOfCalories;
  final int unitAmount;
  final num avgRating;
  final num ratingsCount;
  final int sellingCount;
  final List<ReviewModel> reviews;

  ProductModel(
      {required this.name,
      required this.description,
      required this.price,
      required this.image,
      required this.code,
      required this.isFeatured,
      this.imageUrl,
      required this.expirationMonths,
      this.isOrganic = false,
      required this.noOfCalories,
      required this.unitAmount,
      this.avgRating = 0,
      this.ratingsCount = 0,
      this.sellingCount = 0,
      required this.reviews});
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
      code: json['code'],
      isFeatured: json['isFeatured'],
      expirationMonths: json['expirationMonths'],
      noOfCalories: json['noOfCalories'],
      unitAmount: json['unitAmount'],
      reviews: json['reviews'] != null
          ? List<ReviewModel>.from(
              json['reviews'].map((e) => ReviewModel.fromJson(e)))
          : [],
    );
  }

  toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'code': code,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationMonths': expirationMonths,
      'isOrganic': isOrganic,
      'noOfCalories': noOfCalories,
      'unitAmount': unitAmount,
      'sellingCount': sellingCount,
      'reviews': reviews.map((e) => e.toJson()).toList(),
      //'avgRating': avgRating,
      //'ratingsCount': ratingsCount
    };
  }
}
