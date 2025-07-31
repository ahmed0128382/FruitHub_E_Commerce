import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/repos/products_repo/products_repo.dart';

part 'best_selling_products_state.dart';

class BestSellingProductsCubit extends Cubit<BestSellingProductsState> {
  BestSellingProductsCubit(this.productsRepo)
      : super(BestSellingProductsInitial());

  final ProductsRepo productsRepo;

  Future<void> getBestSellingProducts() async {
    emit(BestSellingProductsLoading());
    final result = await productsRepo.getBestSellingProducts();
    result.fold(
      (failure) =>
          emit(BestSellingProductsFailure(errMessage: failure.message)),
      (products) =>
          emit(BestSellingProductsSuccess(bestSellingProducts: products)),
    );
  }
}
