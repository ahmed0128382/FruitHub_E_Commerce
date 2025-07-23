import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/cart_item.dart';
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
              CartItemsSliverList(),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).size.height * 0.07,
            child: CustomButton(text: 'الدفع 120 جنيه', onTap: () {}),
          ),
        ],
      ),
    );
  }
}
