import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';

class CheckHaveAccountWidget extends StatelessWidget {
  const CheckHaveAccountWidget(
      {super.key,
      required this.notLinkedText,
      required this.linkedText,
      required this.link});
  final String notLinkedText;
  final String linkedText;
  final String link;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          notLinkedText,
          style: AppStyles.semiBold16.copyWith(
            color: Color(0xff949d9e),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(link);
          },
          child: Text(
            linkedText,
            style: AppStyles.semiBold16.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        )
      ],
    );
  }
}
