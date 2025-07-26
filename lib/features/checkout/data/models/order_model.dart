import 'package:fruit_hub/features/checkout/data/models/order_product_model.dart';
import 'package:fruit_hub/features/checkout/data/models/shipping_address_model.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';

class OrderModel {
  final String uId;
  final num totalPrice;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;
  OrderModel(
      {required this.uId,
      required this.totalPrice,
      required this.shippingAddressModel,
      required this.orderProducts,
      this.paymentMethod = 'PayPal'});
  factory OrderModel.fromEntity(OrderEntity orderEntity) {
    return OrderModel(
      uId: orderEntity.uId,
      totalPrice: orderEntity.cartItems.getTotalCartCheckOutPrice(),
      shippingAddressModel:
          ShippingAddressModel.fromEntity(orderEntity.shippingAddress),
      orderProducts: orderEntity.cartItems.carts
          .map((e) => OrderProductModel.fromCartItemEntity(e))
          .toList(),
      paymentMethod: orderEntity.payWithCash! ? 'Cash' : 'PayPal',
    );
  }
  toJson() {
    return {
      'uId': uId,
      'totalPrice': totalPrice,
      'shippingAddressModel': shippingAddressModel.toJson(),
      'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
      'paymentMethod': paymentMethod,
    };
  }
}
