import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/main/presentation/manager/CartCubit/cart_cubit.dart';
import 'package:fruit_hub/features/main/presentation/manager/CartItemCubit/cart_item_cubit.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/cart_items_sliver_list.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/cart_view_header.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: kTopPadding),
                    SizedBox(height: 12),
                    CartViewHeader(),
                    SizedBox(height: 12),
                  ],
                ),
              ),
              CartItemsSliverList(
                cartItems: context.watch<CartCubit>().cartsEntity.carts,
              ),
            ],
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: MediaQuery.of(context).size.height * 0.07,
              child: CustomCartButtonBlocBuilder()),
        ],
      ),
    );
  }
}

class CustomCartButtonBlocBuilder extends StatelessWidget {
  const CustomCartButtonBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomButton(
            text:
                'الدفع ${context.watch<CartCubit>().cartsEntity.getTotalCartCheckOutPrice()} جنيه',
            onTap: () {});
      },
    );
  }
}
