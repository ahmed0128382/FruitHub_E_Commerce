import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/widgets/custom_button.dart';
import 'package:fruit_hub/features/main/presentation/manager/CartCubit/cart_cubit.dart';
import 'package:fruit_hub/features/main/presentation/manager/CartItemCubit/cart_item_cubit.dart';

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
