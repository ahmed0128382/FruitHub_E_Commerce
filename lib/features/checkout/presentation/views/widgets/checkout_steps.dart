import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper/build_error_bar.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/checkout_step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps(
      {super.key, required this.pageNo, required this.pageController});
  final int pageNo;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          getStepTitle().length,
          (index) => Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (index < pageNo) {
                      pageController.animateToPage(index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.bounceIn);
                    } else {
                      buildErrorBar(context,
                          'لا يمكنك التقدم من هنا، أكمل البيانات أولًا');
                    }
                  },
                  child: CheckoutStepItem(
                    isActive: pageNo >= index,
                    title: getStepTitle()[index],
                    stepNumber: index + 1,
                  ),
                ),
              )),
    );
  }
}

List<String> getStepTitle() => [
      'الشحن',
      'العنوان',
      'الدفع',
    ];
