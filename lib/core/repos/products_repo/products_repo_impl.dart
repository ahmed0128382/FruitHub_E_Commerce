import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/errors/failure.dart';
import 'package:fruit_hub/core/models/product_model.dart';
import 'package:fruit_hub/core/repos/products_repo/products_repo.dart';
import 'package:fruit_hub/core/services/data_service.dart';
import 'package:fruit_hub/core/utils/backend_endpoints.dart';

class ProductsRepoImpl implements ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl({required this.databaseService});

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data = await databaseService.getData(
        path: BackendEndpoints.productsPath,
        query: {
          'limit': 10,
          'orderBy': 'sellingCount',
          'descending': true,
        },
      ) as List<Map<String, dynamic>>;

      //print('Raw product json: ${jsonEncode(data.first)}');

      List<ProductEntity> products = data.map((e) {
        try {
          return ProductModel.fromJson(e).toEntity();
        } catch (err) {
          log('Fetch error: in getBestSellingProducts in ProductsRepoImpl ');
          print('❌ Error parsing product: $err');
          print('🧾 Raw product data: $e');
          throw Exception('Invalid product data');
        }
      }).toList();
      //log('getBestSellingProducts no in Products repo impl is :   ${products.length}');
      return Right(products);
    } catch (e) {
      return Left(ServerFailure(message: 'Could not fetch products: $e'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data = await databaseService.getData(
        path: BackendEndpoints.productsPath,
      ) as List<Map<String, dynamic>>;

      List<ProductEntity> products = data.map((e) {
        try {
          return ProductModel.fromJson(e).toEntity();
        } catch (err) {
          print('❌ Error parsing product: $err');
          print('🧾 Raw product data: $e');
          throw Exception('Invalid product data');
        }
      }).toList();
      //log('getProducts no in Products repo impl is :   ${products.length}');
      return Right(products);
    } catch (e) {
      return Left(ServerFailure(message: 'Could not fetch products: $e'));
    }
  }
}
