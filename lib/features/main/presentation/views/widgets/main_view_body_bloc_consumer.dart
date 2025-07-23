import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper/build_error_bar.dart';
import 'package:fruit_hub/features/main/presentation/manager/CartCubit/cart_cubit.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/main_view_body.dart';

class MainViewBodyBlocConsumer extends StatelessWidget {
  const MainViewBodyBlocConsumer({super.key, required this.currentViewIndex});
  final int currentViewIndex;
  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartProductAdded) {
          buildErrorBar(context, 'تم اضافة المنتج بنجاح');
        } else if (state is CartItemRemoved) {
          buildErrorBar(context, 'تم حذف المنتج بنجاح');
        }
      },
      child: MainViewBody(currentViewIndex: currentViewIndex),
    );
  }
}
