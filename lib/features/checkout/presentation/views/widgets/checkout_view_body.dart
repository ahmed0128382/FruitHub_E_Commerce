import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/helper/build_error_bar.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/checkout/domain/entities/paypal_payment_entity/paypal_payment_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/manager/add_order_cubit/add_order_cubit.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/checkout_steps_page_view.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> swipNotifier = ValueNotifier(false);
  ValueNotifier<AutovalidateMode> notifierAutoValidate =
      ValueNotifier(AutovalidateMode.disabled);
  late PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      final newPage = pageController.page!.round();
      if (newPage != currentPage) {
        setState(() {
          currentPage = newPage;
        });
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    notifierAutoValidate.dispose();
    swipNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SizedBox(
        // This prevents unbounded height issues
        height: screenHeight,
        child: Column(
          children: [
            SizedBox(height: kTopPadding),
            CheckoutSteps(
              pageController: pageController,
              pageNo: currentPage,
            ),
            Expanded(
              child: CheckOutStepsPageView(
                swipNotifier: swipNotifier,
                valueListenable: notifierAutoValidate,
                formKey: _formKey,
                pageController: pageController,
              ),
            ),
            CustomButton(
              text: getNextButtonText(currentPage),
              onTap: () {
                switch (currentPage) {
                  case 0:
                    handleShippingValidation(context);
                    break;
                  case 1:
                    handleAddressValidation(context);
                    break;
                  case 2:
                    // var order = context.read<OrderEntity>();
                    // context.read<AddOrderCubit>().addOrder(order);
                    handlePaymentValidation(context);
                    break;
                  default:
                    break;
                }
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  void handleShippingValidation(BuildContext context) {
    if (context.read<OrderEntity>().payWithCash != null) {
      pageController.animateToPage(currentPage + 1,
          duration: const Duration(milliseconds: 300), curve: Curves.bounceIn);
    } else {
      buildErrorBar(context, 'يرجى تحديد طريقة الدفع');
    }
  }

  void handleAddressValidation(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      if (swipNotifier.value) {
        _formKey.currentState!.save();
        pageController.animateToPage(currentPage + 1,
            duration: const Duration(milliseconds: 300),
            curve: Curves.bounceIn);
      } else {
        buildErrorBar(context, 'يرجى حفظ عنوان الشحن');
        notifierAutoValidate.value = AutovalidateMode.always;
      }
    } else {
      buildErrorBar(context, 'يرجى تحديد عنوان الشحن');
      notifierAutoValidate.value = AutovalidateMode.always;
    }
  }

  String getNextButtonText(int currentPage) {
    switch (currentPage) {
      case 0:
        return 'التالي';
      case 1:
        return 'التالي';
      case 2:
        return 'ادفع عبر PayPal';
      // case 3:
      //   return 'التالي';
      default:
        return 'التالي';
    }
  }

  void handlePaymentValidation(BuildContext context) {
    var order = context.read<OrderEntity>();
    PaypalPaymentEntity paypalPayment =
        PaypalPaymentEntity.fromOrderEntity(order);
    var addOrderCubit = context.read<AddOrderCubit>();
    log("Navigating to PayPal page...");
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Simulated PayPal Checkout"),
              ElevatedButton(
                onPressed: () async {
                  await addOrderCubit.addOrder(order);
                },
                child: Text("Simulate Success"),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

// PaypalCheckoutView(
//         sandboxMode: true,
//         clientId: paypalClientId,
//         secretKey: paypalSecretKey,
//         transactions: [
//           paypalPayment.toJson(),
//         ],
//         note: "Contact us for any questions on your order.",
//         onSuccess: (Map params) async {
//           Navigator.pop(context);
//           addOrderCubit.addOrder(order);
//           //buildErrorBar(context, 'تم الدفع بنجاح');
//         },
//         onError: (error) {
//           print("onError: $error");
//           Navigator.pop(context);
//         },
//         onCancel: () {
//           print('cancelled:');
//         },
//       ),
//     )
