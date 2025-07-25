import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/checkout_step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key, required this.pageNo});
  final int pageNo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          getStepTitle().length,
          (index) => Expanded(
                child: CheckoutStepItem(
                  isActive: pageNo >= index,
                  title: getStepTitle()[index],
                  stepNumber: index + 1,
                ),
              )),
    );
  }
}

List<String> getStepTitle() => ['الشحن', 'العنوان', 'الدفع', 'المراجعة'];
