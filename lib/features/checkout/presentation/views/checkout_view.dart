import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:fruit_hub/features/main/domain/entities/carts_entity.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartItems});
  static const String routeName = 'checkout';
  final CartsEntity cartItems;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'الشحن'),
      body: Provider.value(
          value: OrderEntity(
            cartItems: cartItems,
          ),
          child: CheckoutViewBody()),
    );
  }
}
