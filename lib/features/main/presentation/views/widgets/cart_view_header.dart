import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/features/main/presentation/manager/CartCubit/cart_cubit.dart';

class CartViewHeader extends StatelessWidget {
  const CartViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //height: 41,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      //clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Color(0xffebf9f1),
      ),
      child: Center(
        child: Text(
          'لديك ${context.watch<CartCubit>().cartsEntity.carts.length} منتجات في سلة التسوق',
          style: AppStyles.regular13.copyWith(color: Color(0xff1b5e37)),
        ),
      ),
    );
  }
}
