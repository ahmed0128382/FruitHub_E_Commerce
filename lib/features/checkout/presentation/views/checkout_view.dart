import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper/get_user.dart';
import 'package:fruit_hub/core/repos/orders_repo/orders_repo.dart';
import 'package:fruit_hub/core/services/get_it_service.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/checkout/domain/entities/shipping_address_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/manager/add_order_cubit/add_order_cubit.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/add_order_cubit_bloc_consumer.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:fruit_hub/features/main/domain/entities/carts_entity.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.cartItems});
  static const String routeName = 'checkout';
  final CartsEntity cartItems;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late OrderEntity orderEntity;
  @override
  void initState() {
    orderEntity = OrderEntity(
      uId: getUser().email,
      shippingAddress: ShippingAddressEntity(),
      cartItems: widget.cartItems,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(
        getIt.get<OrdersRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'الشحن'),
        body: MultiRepositoryProvider(
          providers: [
            RepositoryProvider<OrderEntity>(
              create: (_) => orderEntity,
            ),
          ],
          child: AddOrderCubitBlocConsumer(child: CheckoutViewBody()),
        ),
      ),
    );
  }
}
