import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';

class SwipActiveActionButton extends StatelessWidget {
  const SwipActiveActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      width: 40,
      height: 20,
      decoration: ShapeDecoration(
        color: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 18,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: OvalBorder(),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
