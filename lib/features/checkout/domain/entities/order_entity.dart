import 'package:fruit_hub/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruit_hub/features/main/domain/entities/carts_entity.dart';

class OrderEntity {
  final String? uId;
  final CartsEntity cartItems;
  bool? payWithCash;
  ShippingAddressEntity shippingAddress;

  OrderEntity({
    required this.cartItems,
    this.payWithCash,
    required this.shippingAddress,
    required this.uId,
  });
}
