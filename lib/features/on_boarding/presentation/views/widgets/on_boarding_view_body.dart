import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/features/on_boarding/presentation/views/widgets/custom_button.dart';
import 'package:fruit_hub/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OnBoardingPageView(),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
              activeColor: AppColors.primaryColor,
              color: AppColors.primaryColor.withValues(alpha: 0.5)),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomButton(
            text: 'ابدأ الأن',
            onTap: () {},
          ),
        )
      ],
    );
  }
}
