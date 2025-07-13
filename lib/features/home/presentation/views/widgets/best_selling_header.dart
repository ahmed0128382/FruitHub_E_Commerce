import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'الأكثر مبيعاً',
          style: AppStyles.bold16,
        ),
        Spacer(),
        Text(
          'المزيد',
          style: AppStyles.regular13.copyWith(
            color: Color(0xff949d9e),
          ),
        ),
      ],
    );
  }
}
