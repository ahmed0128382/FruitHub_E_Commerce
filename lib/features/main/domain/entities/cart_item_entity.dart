import 'package:equatable/equatable.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';

// ignore: must_be_immutable
class CartItemEntity extends Equatable {
  final ProductEntity product;
  int count;

  CartItemEntity({
    required this.product,
    this.count = 1,
  });

  num calculateTotalPrice() => product.price * count;

  num calculateTotalAmount() => product.unitAmount * count;

  increaseCount() => count++;
  decreaseCount() => count--;

  @override
  // TODO: implement props
  List<Object?> get props => [product, count];
}
