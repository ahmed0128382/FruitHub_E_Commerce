import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/features/main/domain/entities/cart_item_entity.dart';
import 'package:fruit_hub/features/main/domain/entities/carts_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  final CartsEntity cartsEntity = CartsEntity([]);
  void addProduct(ProductEntity product) {
    bool isProductExists = cartsEntity.isExists(product);
    var cartItem = cartsEntity.getCartItem(product);

    if (isProductExists) {
      cartItem.increaseCount();
    } else {
      cartsEntity.addCartItem(cartItem);
    }
    emit(CartProductAdded());
  }

  void deleteCartItem(CartItemEntity cartItem) {
    cartsEntity.removeCartItem(cartItem);
    emit(CartItemRemoved());
  }
}
