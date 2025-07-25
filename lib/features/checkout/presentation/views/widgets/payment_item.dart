import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_decorations.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key, required this.title, required this.child});
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.bold13.copyWith(
            color: const Color(0xff0c0d0d),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 16,
          ),
          decoration: AppDecorations.greyShapeDecoration,
          child: child,
        ),
      ],
    );
  }
}
