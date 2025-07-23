import 'dart:developer';

import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/features/main/domain/entities/cart_item_entity.dart';

class CartsEntity {
  final List<CartItemEntity> carts;

  CartsEntity(this.carts);

  addCartItem(CartItemEntity item) => carts.add(item);
  bool isExists(ProductEntity product) {
    for (var cart in carts) {
      if (cart.product == product) {
        return true;
      }
    }
    return false;
  }

  removeCartItem(CartItemEntity item) => carts.remove(item);

  CartItemEntity getCartItem(ProductEntity product) {
    for (var cart in carts) {
      if (cart.product == product) {
        return cart;
      }
    }
    return CartItemEntity(product: product, count: 1);
  }

  num getTotalCartCheckOutPrice() {
    num total = 0;
    for (var cart in carts) {
      total += cart.calculateTotalPrice();
    }
    // log('total money in button is: $total');
    return total;
  }
}
