import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartItemActionButton(
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          color: AppColors.primaryColor,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '3',
            textAlign: TextAlign.center,
            style: AppStyles.bold16,
          ),
        ),
        CartItemActionButton(
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
    return Container(
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
    );
  }
}
