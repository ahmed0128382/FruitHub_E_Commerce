import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/cart_item_action_buttons.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 83,
              height: 102,
              decoration: BoxDecoration(
                  //color: Color(0xfff3f5f7),
                  ),
              child: Image.network(
                  'https://weresmartworld.com/sites/default/files/styles/full_screen/public/2021-04/watermeloen_2.jpg?itok=CCYHLr5M'),
            ),
            const SizedBox(width: 17),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'بطيخ',
                          style: AppStyles.bold13,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(AppImages.imagesTrash),
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      '3 ك',
                      style: AppStyles.regular13
                          .copyWith(color: AppColors.secondaryColor),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CartItemActionButtons(),
                        Text(
                          '60 جنيه',
                          style: AppStyles.bold16
                              .copyWith(color: AppColors.secondaryColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
