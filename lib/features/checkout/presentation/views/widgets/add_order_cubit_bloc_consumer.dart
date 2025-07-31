import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper/build_error_bar.dart';
import 'package:fruit_hub/core/widgets/custom_progress_hud.dart';
import 'package:fruit_hub/features/checkout/presentation/manager/add_order_cubit/add_order_cubit.dart';
import 'package:fruit_hub/features/main/presentation/manager/CartCubit/cart_cubit.dart';

class AddOrderCubitBlocConsumer extends StatelessWidget {
  const AddOrderCubitBlocConsumer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        if (state is AddOrderSuccess) {
          buildErrorBar(context, 'تم اضافة الطلب بنجاح');
          context.read<CartCubit>().deleteAllCartItems();
          Navigator.pop(context);
          Navigator.pop(context);
        }
        if (state is AddOrderFailure) {
          buildErrorBar(context, state.errMessage);
          Navigator.pop(context);
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
            isLoading: state is AddOrderLoading, child: child);
      },
    );
  }
}
