import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helper/build_error_bar.dart';
import 'package:fruit_hub/core/helper/get_user.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AppImages.imagesFaceProfilePng,
          // width: 30,
          // height: 30,
        ),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'صباح الخير!.. ',
              textAlign: TextAlign.right,
              style:
                  AppStyles.regular16.copyWith(color: const Color(0xff949d9e)),
            ),
            Text(
              getUser().name,
              textAlign: TextAlign.right,
              style: AppStyles.bold16.copyWith(color: const Color(0xff0c0d0d)),
            ),
          ],
        ),
        Spacer(),
        IconButton(
          icon: const Icon(
            Icons.notifications,
            size: 30,
            color: AppColors.primaryColor,
          ),
          onPressed: () {
            // Handle notification button press
            buildErrorBar(context, 'لا توجد إشعارات جديدة');
          },
        ),
      ],
    );
  }
}
