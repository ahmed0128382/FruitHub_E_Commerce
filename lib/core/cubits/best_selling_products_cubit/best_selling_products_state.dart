part of 'best_selling_products_cubit.dart';

sealed class BestSellingProductsState extends Equatable {
  const BestSellingProductsState();

  @override
  List<Object> get props => [];
}

final class BestSellingProductsInitial extends BestSellingProductsState {}

final class BestSellingProductsLoading extends BestSellingProductsState {}

final class BestSellingProductsSuccess extends BestSellingProductsState {
  final List<ProductEntity> bestSellingProducts;
  BestSellingProductsSuccess({required this.bestSellingProducts});
}

final class BestSellingProductsFailure extends BestSellingProductsState {
  final String errMessage;
  BestSellingProductsFailure({required this.errMessage});
}
