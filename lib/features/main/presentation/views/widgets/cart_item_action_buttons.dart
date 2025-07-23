import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/features/main/domain/entities/cart_item_entity.dart';
import 'package:fruit_hub/features/main/presentation/manager/CartItemCubit/cart_item_cubit.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartItemActionButton(
          onPressed: () {
            cartItemEntity.increaseCount();

            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          color: AppColors.primaryColor,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '${cartItemEntity.count}',
            textAlign: TextAlign.center,
            style: AppStyles.bold16,
          ),
        ),
        CartItemActionButton(
          onPressed: () {
            if (cartItemEntity.count > 1) {
              cartItemEntity.decreaseCount();
              context.read<CartItemCubit>().updateCartItem(cartItemEntity);
            }
          },
          icon: const Icon(
            Icons.remove,
            color: Color(0xfff3f5f7),
          ),
          color: Colors.grey,
        ),
      ],
    );
  }
}

class CartItemActionButton extends StatelessWidget {
  const CartItemActionButton(
      {super.key, required this.icon, required this.color, this.onPressed});
  final Icon icon;
  final Color color;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 24,
        width: 24,
        padding: const EdgeInsets.all(2),
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: FittedBox(child: icon),
      ),
    );
  }
}
