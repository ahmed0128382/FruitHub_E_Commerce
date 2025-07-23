import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/features/main/domain/entities/cart_item_entity.dart';
import 'package:fruit_hub/features/main/presentation/manager/CartCubit/cart_cubit.dart';
import 'package:fruit_hub/features/main/presentation/manager/CartItemCubit/cart_item_cubit.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/cart_item_action_buttons.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.cartItemEntity,
  });
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if (current is CartItemUpdated) {
          return current.cartItemEntity == cartItemEntity;
        }
        return false;
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Container(
                  width: 83,
                  height: 102,
                  decoration: BoxDecoration(
                      //color: Color(0xfff3f5f7),
                      ),
                  child: Image.network(cartItemEntity.product.imageUrl!),
                ),
                const SizedBox(width: 17),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              cartItemEntity.product.name,
                              style: AppStyles.bold13,
                            ),
                            GestureDetector(
                              onTap: () {
                                context
                                    .read<CartCubit>()
                                    .deleteCartItem(cartItemEntity);
                              },
                              child: SvgPicture.asset(AppImages.imagesTrash),
                            ),
                          ],
                        ),
                        Spacer(),
                        Text(
                          '${cartItemEntity.calculateTotalAmount()} ك',
                          style: AppStyles.regular13
                              .copyWith(color: AppColors.secondaryColor),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CartItemActionButtons(
                              cartItemEntity: cartItemEntity,
                            ),
                            Text(
                              '${cartItemEntity.calculateTotalPrice()} جنيه',
                              style: AppStyles.bold16
                                  .copyWith(color: AppColors.secondaryColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
