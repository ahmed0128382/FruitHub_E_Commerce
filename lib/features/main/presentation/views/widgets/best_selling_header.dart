import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/features/best_selling/presentation/views/best_selling_view.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, BestSellingView.routeName);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'الأكثر مبيعاً',
            style: AppStyles.bold16,
          ),
          //Spacer(),
          Text(
            'المزيد',
            style: AppStyles.regular13.copyWith(
              color: Color(0xff949d9e),
            ),
          ),
        ],
      ),
    );
  }
}
