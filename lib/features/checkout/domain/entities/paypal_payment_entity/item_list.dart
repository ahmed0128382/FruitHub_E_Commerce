import 'package:fruit_hub/features/main/domain/entities/cart_item_entity.dart';

import 'item.dart';

class ItemListEntity {
  List<ItemEntity>? items;

  ItemListEntity({this.items});

  factory ItemListEntity.fromCartItemsEntity(
          {required List<CartItemEntity> cartItems}) =>
      ItemListEntity(
        items: cartItems
            .map((cartItemEntity) =>
                ItemEntity.fromCartItemEntity(cartItemEntity))
            .toList(),
      );

  factory ItemListEntity.fromJson(Map<String, dynamic> json) => ItemListEntity(
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => ItemEntity.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'items': items?.map((e) => e.toJson()).toList(),
      };
}
