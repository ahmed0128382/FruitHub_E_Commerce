import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';

class SwipActionButton extends StatelessWidget {
  const SwipActionButton({
    super.key,
    required this.isSwipped,
    required this.onSwipChanged,
  });

  final bool isSwipped;
  final ValueChanged<bool> onSwipChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSwipChanged(!isSwipped),
      child: Container(
        width: 40,
        height: 20,
        padding: const EdgeInsets.all(2),
        decoration: ShapeDecoration(
          color: isSwipped ? AppColors.primaryColor : AppColors.lightWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: AnimatedAlign(
          duration: Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          alignment: isSwipped ? Alignment.centerLeft : Alignment.centerRight,
          child: Container(
            width: 16,
            height: 18,
            decoration: ShapeDecoration(
              color: isSwipped ? Colors.white : AppColors.semilightWhite,
              shape: OvalBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
