import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/address_section.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/payment_section.dart';

import 'package:fruit_hub/features/checkout/presentation/views/widgets/shipping_section.dart';

class CheckOutStepsPageView extends StatelessWidget {
  const CheckOutStepsPageView({
    super.key,
    required this.pageController,
    required this.formKey,
  });
  final GlobalKey<FormState> formKey;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kHorizontalPadding),
      child: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return getPages()[index];
        },
        itemCount: getStepTitle().length,
      ),
    );
  }

  List<Widget> getPages() {
    return [
      const ShippingSection(),
      AddressSection(
        formKey: formKey,
      ),
      const PaymentSection(),
      // const ReviewSection(),
    ];
  }
}
