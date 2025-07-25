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
      children: [
        Text(
          title,
          style: AppStyles.semiBold13,
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          decoration: AppDecorations.greyShapeDecoration,
          child: child,
        ),
      ],
    );
  }
}
