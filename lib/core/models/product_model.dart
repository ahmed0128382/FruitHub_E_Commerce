import 'package:fruit_hub/core/entities/product_entity.dart';

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
  // factory ProductModel.fromJson(Map<String, dynamic> json) {
  //   return ProductModel(
  //     avgRating: getAvgRating(json['reviews']),
  //     ratingsCount: json['ratingsCount'],
  //     sellingCount: json['sellingCount'],
  //     name: json['name'],
  //     description: json['description'],
  //     price: json['price'],
  //     code: json['code'],
  //     isFeatured: json['isFeatured'],
  //     expirationMonths: json['expirationMonths'],
  //     noOfCalories: json['noOfCalories'],
  //     unitAmount: json['unitAmount'],
  //     reviews: json['reviews'] != null
  //         ? (json['reviews'] as List)
  //             .map((e) => ReviewModel.fromJson(e))
  //             .toList()
  //         : [],
  //   );
  // }
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      code: json['code'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      isOrganic: json['isOrganic'],
      isFeatured: json['isFeatured'],
      price: json['price'],
      unitAmount: json['unitAmount'],
      noOfCalories: json['noOfCalories'],
      expirationMonths: json['expirationMonths'],
      sellingCount: json['sellingCount'],
      reviews: (json['reviews'] as List<dynamic>?)
              ?.map((e) => ReviewModel.fromJson(e))
              .toList() ??
          [],
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

  static List<ReviewModel> parseReviews(dynamic raw) {
    if (raw is List) {
      return raw.map((e) {
        if (e is Map<String, dynamic>) {
          return ReviewModel.fromJson(e);
        } else if (e is Map) {
          return ReviewModel.fromJson(Map<String, dynamic>.from(e));
        } else {
          throw Exception('Unexpected review item type: ${e.runtimeType}');
        }
      }).toList();
    }
    return [];
  }
}
