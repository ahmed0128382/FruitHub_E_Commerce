import 'package:flutter/material.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/cart_item.dart';

class CartItemsSliverList extends StatelessWidget {
  const CartItemsSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => const Divider(
        indent: 24,
        endIndent: 24,
        thickness: 1.3,
        color: Color(0xfff1f1f5),
      ),
      itemBuilder: (context, index) {
        return CartItem();
      },
      itemCount: 10,
    );
  }
}
