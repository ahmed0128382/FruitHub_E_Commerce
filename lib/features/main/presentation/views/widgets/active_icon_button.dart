import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';

class ActiveIconButton extends StatelessWidget {
  const ActiveIconButton({
    super.key,
    required this.icon,
    required this.label,
    this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        //width: 96,
        height: 36,
        padding: const EdgeInsets.only(left: 12),
        decoration: ShapeDecoration(
          color: const Color(0xffeeeeee),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              alignment: Alignment.center, // Centers the icon perfectly
              decoration: ShapeDecoration(
                color: const Color(0xff1b5e37),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Icon(icon, color: Colors.white, size: 20),
            ),

            const SizedBox(width: 8), // Adjusted spacing from icon to text
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 4), // Fine-tuned label padding
                child: Text(
                  label,
                  style: AppStyles.semiBold11.copyWith(
                    color: AppColors.primaryColor,
                    overflow: TextOverflow.fade,
                  ),
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
