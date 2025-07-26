import 'package:fruit_hub/features/main/domain/entities/cart_item_entity.dart';

class OrderProductModel {
  final String name;
  final String imageUrl;
  final int quantity;
  final num price;
  final String code;

  OrderProductModel(
      {required this.name,
      required this.imageUrl,
      required this.quantity,
      required this.price,
      required this.code});

  factory OrderProductModel.fromCartItemEntity(CartItemEntity cartItem) =>
      OrderProductModel(
          name: cartItem.product.name,
          imageUrl: cartItem.product.imageUrl ?? '',
          quantity: cartItem.count,
          price: cartItem.product.price,
          code: cartItem.product.code);

  toJson() => {
        'name': name,
        'imageUrl': imageUrl,
        'quantity': quantity,
        'price': price,
        'code': code,
      };
}
