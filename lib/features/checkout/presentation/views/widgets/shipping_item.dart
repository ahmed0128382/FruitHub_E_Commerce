import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.price,
      required this.isActive,
      required this.onTap});
  final String title, subTitle;
  final num price;
  final bool isActive;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.only(
          top: 16,
          left: 13,
          right: 28,
          bottom: 16,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Color(0x33d9d9d9),
          shape: RoundedRectangleBorder(
            side: isActive
                ? BorderSide(
                    width: 1,
                    color: AppColors.primaryColor,
                  )
                : BorderSide.none,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                width: 18,
                height: 18,
                clipBehavior: Clip.antiAlias,
                decoration: const ShapeDecoration(
                  //color: Color(0xffffffff),
                  shape: OvalBorder(
                    side: BorderSide(
                      width: 1,
                      color: Color(0xff949d9e),
                    ),
                  ),
                ),
                child: isActive
                    ? Container(
                        width: 18,
                        height: 18,
                        clipBehavior: Clip.antiAlias,
                        decoration: const ShapeDecoration(
                          color: AppColors.primaryColor,
                          shape: OvalBorder(),
                        ),
                      )
                    : SizedBox(),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppStyles.semiBold13.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    subTitle,
                    style: AppStyles.regular13.copyWith(
                      color: Color(0xffaaaaaa),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Center(
                child: Text('$price جنيه',
                    style: AppStyles.bold13.copyWith(
                      color: AppColors.primaryColor,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
