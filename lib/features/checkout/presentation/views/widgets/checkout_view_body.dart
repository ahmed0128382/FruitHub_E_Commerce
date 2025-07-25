import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/checkout_steps_page_view.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          SizedBox(height: kTopPadding),
          CheckoutSteps(
            pageController: pageController,
            pageNo: currentPage,
          ),
          Expanded(
            child: CheckOutStepsPageView(pageController: pageController),
          ),
          CustomButton(
              text: getNextButtonText(currentPage),
              onTap: () {
                pageController.animateToPage(currentPage + 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceIn);
              }),
          SizedBox(height: 24),
        ],
      ),
    );
  }

  String getNextButtonText(int currentPage) {
    switch (currentPage) {
      case 0:
        return 'التالي';
      case 1:
        return 'التالي';
      case 2:
        return 'ادفع عبر PayPal';
      case 3:
        return 'التالي';
      default:
        return 'التالي';
    }
  }
}
