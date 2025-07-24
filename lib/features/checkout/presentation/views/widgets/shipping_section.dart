import 'package:flutter/material.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/shipping_item.dart';

class ShippingSection extends StatelessWidget {
  const ShippingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: const [
      SizedBox(
        height: 33,
      ),
      ShippingItem(
        title: 'الدفع عند الاستلام',
        subTitle: 'التسليم من المكان ',
        price: 40,
      ),
      SizedBox(
        height: 16,
      ),
      ShippingItem(
        title: 'الدفع أونلاين',
        subTitle: 'يرجي تحديد طريقة الدفع',
        price: 40,
      ),
    ]);
  }
}
