import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1.3,
            color: Color(0xffdcdede),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            'أو',
            style: AppStyles.semiBold16,
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1.3,
            color: Color(0xffdcdede),
          ),
        ),
      ],
    );
  }
}
