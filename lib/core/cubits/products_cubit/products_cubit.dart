import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/repos/products_repo/products_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());

  final ProductsRepo productsRepo;

  int productsCount = 0;
  Future<void> getProducts() async {
    emit(ProductsLoading());
    final failureOrProducts = await productsRepo.getProducts();
    failureOrProducts.fold(
      (failure) {
        log('Fetch error in getProducts: ${failure.message}');
        emit(ProductsFailure(errMessage: failure.message));
      },
      (products) {
        productsCount = products.length;
        emit(ProductsSuccess(products: products));
      },
    );
  }
}

// class ProductsCubit extends Cubit<ProductsState> {
//   ProductsCubit(this.productsRepo) : super(ProductsInitial());

//   final ProductsRepo productsRepo;
//   int productsCount = 0;
//   Future<void> getProducts() async {
//     emit(ProductsLoading());
//     final failureOrProducts = await productsRepo.getProducts();

//     failureOrProducts.fold(
//       (failure) {
//         log('Fetch error: in getProducts in ProductsCubit ${failure.message}');
//         emit(ProductsFailure(errMessage: failure.message));
//       },
//       (products) {
//         productsCount = products.length;
//         //log('getProducts no in cubit is :   ${products.length}');
//         emit(ProductsSuccess(products: products));
//       },
//     );
//   }

//   Future<void> getBestSellingProducts() async {
//     emit(ProductsLoading());
//     final failureOrProducts = await productsRepo.getBestSellingProducts();
//     // log('getBestSellingProducts no is :   ${failureOrProducts.length()}');
//     failureOrProducts.fold(
//       (failure) {
//         log('Fetch error: in getBestSellingProducts in ProductsCubit ${failure.message}');
//         emit(
//           ProductsFailure(errMessage: failure.message),
//         );
//       },
//       (products) => {
//         //  log('getBestSellingProducts no in cubit is :   ${products.length}'),
//         emit(BestSellingProductsSuccess(bestSellingProducts: products))
//       },
//     );
//   }
// }
