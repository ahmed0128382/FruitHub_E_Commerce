import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/features/main/presentation/manager/CartCubit/cart_cubit.dart';
import 'package:fruit_hub/features/main/presentation/manager/CartItemCubit/cart_item_cubit.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/cart_items_sliver_list.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/cart_view_header.dart';

import 'package:fruit_hub/features/main/presentation/views/widgets/expandableCartButton.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  bool isExpanded = false;
  Offset cartIconPosition = Offset(16, 80); // initial icon position

  void handleDrag(Offset delta) {
    setState(() {
      cartIconPosition += delta;
    });
  }

  void expandCartButton() {
    setState(() => isExpanded = true);
  }

  void collapseCartButton() {
    setState(() => isExpanded = false);
  }

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
          BlocBuilder<CartItemCubit, CartItemState>(
            builder: (context, state) {
              final String totalPrice =
                  '${context.watch<CartCubit>().cartsEntity.getTotalCartCheckOutPrice()} جنيه';

              return isExpanded
                  ? Positioned(
                      left: 0,
                      right: 0,
                      bottom: MediaQuery.of(context).size.height * 0.07,
                      child: ExpandableCartButton(
                        onCollapse: collapseCartButton,
                        totalPrice: totalPrice,
                      ),
                    )
                  : Positioned(
                      left: cartIconPosition.dx,
                      bottom: cartIconPosition.dy,
                      child: GestureDetector(
                        onPanUpdate: (details) => handleDrag(
                            Offset(details.delta.dx, -details.delta.dy)),
                        onTap: expandCartButton,
                        child: Material(
                          elevation: 6,
                          shape: CircleBorder(),
                          color: AppColors.primaryColor,
                          child: SizedBox(
                            width: 48,
                            height: 48,
                            child: Icon(Icons.shopping_cart,
                                color: Colors.white, size: 24),
                          ),
                        ),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
// class CartViewBody extends StatelessWidget {
//   const CartViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
//       child: Stack(
//         children: [
//           CustomScrollView(
//             slivers: [
//               SliverToBoxAdapter(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: kTopPadding),
//                     SizedBox(height: 12),
//                     CartViewHeader(),
//                     SizedBox(height: 12),
//                   ],
//                 ),
//               ),
//               CartItemsSliverList(
//                 cartItems: context.watch<CartCubit>().cartsEntity.carts,
//               ),
//             ],
//           ),
//           Positioned(
//               left: 0,
//               right: 0,
//               bottom: MediaQuery.of(context).size.height * 0.07,
//               child: ExpandableCartButton()),
//         ],
//       ),
//     );
//   }
// }
