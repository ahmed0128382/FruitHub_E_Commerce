import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        AppImages.imagesFaceProfile,
        // width: 30,
        // height: 30,
      ),
      title: Text(
        ' ..! صباح الخير ',
        textAlign: TextAlign.right,
        style: AppStyles.regular16.copyWith(color: const Color(0xff949d9e)),
      ),
      subtitle: Text(
        'أحمد أبوموسي',
        textAlign: TextAlign.right,
        style: AppStyles.bold16.copyWith(color: const Color(0xff0c0d0d)),
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.notifications,
          size: 30,
          color: AppColors.primaryColor,
        ),
        onPressed: () {
          // Handle notification button press
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('لا توجد إشعارات جديدة')),
          );
        },
      ),
    );
  }
}
