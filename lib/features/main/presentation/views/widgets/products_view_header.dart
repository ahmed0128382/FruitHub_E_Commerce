import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';

class ProductsViewHeader extends StatelessWidget {
  const ProductsViewHeader({super.key, required this.productsCount});
  final int productsCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$productsCount نتائج',
          style: AppStyles.bold16,
        ),
        //Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: ShapeDecoration(
              color: Colors.white.withValues(alpha: 0.100001),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: Color(0x66cacece),
                ),
                borderRadius: BorderRadius.circular(4),
              )),
          child: SvgPicture.asset(
            AppImages.imagesArrowSwapHorizontal,
          ),
        ),
      ],
    );
  }
}
