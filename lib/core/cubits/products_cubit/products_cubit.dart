import 'package:bloc/bloc.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/repos/products_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());

  final ProductsRepo productsRepo;

  Future<void> getProducts() async {
    emit(ProductsLoading());
    final failureOrProducts = await productsRepo.getProducts();
    failureOrProducts.fold(
      (failure) => emit(ProductsFailure(errMessage: failure.message)),
      (products) => emit(ProductsSuccess(products: products)),
    );
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    final failureOrProducts = await productsRepo.getBestSellingProducts();
    failureOrProducts.fold(
      (failure) => emit(ProductsFailure(errMessage: failure.message)),
      (products) => emit(ProductsSuccess(products: products)),
    );
  }
}
