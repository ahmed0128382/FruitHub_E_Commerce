import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/shipping_item.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection>
    with AutomaticKeepAliveClientMixin {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    var orderEntity = context.read<OrderEntity>();
    return Column(children: [
      const SizedBox(
        height: 33,
      ),
      ShippingItem(
        onTap: () {
          selectedIndex = 0;
          setState(() {});
          orderEntity.payWithCash = true;
        },
        isActive: selectedIndex == 0,
        title: 'الدفع عند الاستلام',
        subTitle: 'التسليم من المكان ',
        price: orderEntity.cartItems.getTotalCartCheckOutPrice() + 30,
      ),
      const SizedBox(
        height: 16,
      ),
      ShippingItem(
        onTap: () {
          selectedIndex = 1;
          setState(() {});
          orderEntity.payWithCash = false;
        },
        isActive: selectedIndex == 1,
        title: 'الدفع أونلاين',
        subTitle: 'يرجي تحديد طريقة الدفع',
        price:
            context.read<OrderEntity>().cartItems.getTotalCartCheckOutPrice(),
      ),
    ]);
  }

  @override
  bool get wantKeepAlive => true;
}
