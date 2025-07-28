import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';

class DetailsEntity {
  String? subtotal;
  String? shipping;
  num? shippingDiscount;

  DetailsEntity({this.subtotal, this.shipping, this.shippingDiscount});

  factory DetailsEntity.fromOrderEntity(OrderEntity order) => DetailsEntity(
        subtotal: order.cartItems.getTotalCartCheckOutPrice().toString(),
        shipping: order.calculateShippingPrice().toString(),
        shippingDiscount: order.calculateDiscount(),
      );
  factory DetailsEntity.fromJson(Map<String, dynamic> json) => DetailsEntity(
        subtotal: json['subtotal'] as String?,
        shipping: json['shipping'] as String?,
        shippingDiscount: json['shipping_discount'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'subtotal': subtotal,
        'shipping': shipping,
        'shipping_discount': shippingDiscount,
      };
}
