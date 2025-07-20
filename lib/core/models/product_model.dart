import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/entities/review_entity.dart';
import 'package:fruit_hub/core/helper/get_avg_rating.dart';
import 'package:fruit_hub/core/models/review_model.dart';

class ProductModel {
  final String name;
  final String description;
  final num price;

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
      avgRating: getAvgRating(json['reviews']),
      ratingsCount: json['ratingsCount'],
      sellingCount: json['sellingCount'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
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
  ProductEntity toEntity() {
    return ProductEntity(
      sellingCount: sellingCount,
      name: name,
      description: description,
      price: price,
      code: code,
      isFeatured: isFeatured,
      imageUrl: imageUrl,
      expirationMonths: expirationMonths,
      isOrganic: isOrganic,
      noOfCalories: noOfCalories,
      unitAmount: unitAmount,
      avgRating: avgRating,
      ratingsCount: ratingsCount,
      reviews: reviews.map((e) => e.toEntity()).toList(),
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
