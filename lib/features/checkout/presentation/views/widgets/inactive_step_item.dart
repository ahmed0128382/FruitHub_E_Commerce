import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';

class InactiveStepItem extends StatelessWidget {
  const InactiveStepItem(
      {super.key, required this.stepNumber, required this.title});
  final int stepNumber;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: Color(0xfff2f3f3),
          child: Text('$stepNumber', style: AppStyles.semiBold13),
        ),
        const SizedBox(width: 4),
        Text(
          title,
          style: AppStyles.semiBold13.copyWith(
            color: Color(0xffaaaaaa),
          ),
        ),
      ],
    );
  }
}
