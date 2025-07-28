import 'package:fruit_hub/core/helper/get_currency.dart';
import 'package:fruit_hub/features/main/domain/entities/cart_item_entity.dart';

class ItemEntity {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  ItemEntity({this.name, this.quantity, this.price, this.currency});

  factory ItemEntity.fromCartItemEntity(CartItemEntity cartItemEntity) =>
      ItemEntity(
        name: cartItemEntity.product.name,
        quantity: cartItemEntity.count,
        price: cartItemEntity.product.price.toString(),
        currency: getCurrency(),
      );

  factory ItemEntity.fromJson(Map<String, dynamic> json) => ItemEntity(
        name: json['name'] as String?,
        quantity: json['quantity'] as int?,
        price: json['price'] as String?,
        currency: json['currency'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'quantity': quantity,
        'price': price,
        'currency': currency,
      };
}
