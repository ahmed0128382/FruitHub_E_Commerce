import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/active_step_item.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/inactive_step_item.dart';

class CheckoutStepItem extends StatelessWidget {
  const CheckoutStepItem(
      {super.key,
      required this.title,
      required this.stepNumber,
      required this.isActive});
  final String title;
  final int stepNumber;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: InactiveStepItem(stepNumber: stepNumber, title: title),
      secondChild: ActiveStepItem(title: title),
      crossFadeState:
          isActive ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 400),
    );
  }
}
