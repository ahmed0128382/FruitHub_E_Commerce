import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/widgets/app_bar_widget.dart';
import 'package:fruit_hub/features/main/presentation/manager/CartItemCubit/cart_item_cubit.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/cart_view_body.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/custom_button_navigation_bar.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int currentViewIndex = 0;

  void onTabSelected(int index) {
    setState(() {
      currentViewIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        context,
        title: 'سلة التسوق',
        showBackArrow: false,
      ),
      // bottomNavigationBar: CustomButtonNavigationBar(
      //   currentIndex: currentViewIndex,
      //   onTap: onTabSelected,
      // ),
      body: BlocProvider(
        create: (context) => CartItemCubit(),
        child: CartViewBody(),
      ),
    );
  }
}
