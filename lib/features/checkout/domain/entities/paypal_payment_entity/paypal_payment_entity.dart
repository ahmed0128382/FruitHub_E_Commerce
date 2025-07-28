import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';

import 'amount.dart';
import 'item_list.dart';

class PaypalPaymentEntity {
  AmountEntity? amount;
  String? description;
  ItemListEntity? itemList;

  PaypalPaymentEntity({this.amount, this.description, this.itemList});

  factory PaypalPaymentEntity.fromOrderEntity(OrderEntity orderEntity) {
    return PaypalPaymentEntity(
      amount: AmountEntity.fromOrderEntity(orderEntity),
      description: 'Order #${orderEntity.uId}',
      itemList: ItemListEntity.fromCartItemsEntity(
          cartItems: orderEntity.cartItems.carts),
    );
  }

  factory PaypalPaymentEntity.fromJson(Map<String, dynamic> json) {
    return PaypalPaymentEntity(
      amount: json['amount'] == null
          ? null
          : AmountEntity.fromJson(json['amount'] as Map<String, dynamic>),
      description: json['description'] as String?,
      itemList: json['item_list'] == null
          ? null
          : ItemListEntity.fromJson(json['item_list'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'amount': amount?.toJson(),
        'description': description,
        'item_list': itemList?.toJson(),
      };
}
