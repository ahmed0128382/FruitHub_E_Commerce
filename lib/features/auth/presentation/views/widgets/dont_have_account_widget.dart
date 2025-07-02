import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/features/auth/presentation/views/sign_up_view.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'لا تمتلك حساب؟',
          style: AppStyles.semiBold16.copyWith(
            color: Color(0xff949d9e),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(SignUpView.routeName);
          },
          child: Text(
            'قم بإنشاء حساب',
            style: AppStyles.semiBold16.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        )
      ],
    );
  }
}
