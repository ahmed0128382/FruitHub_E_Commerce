import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/checkout/presentation/views/widgets/payment_item.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    var orderEntity = context.read<OrderEntity>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        PaymentItem(
          title: 'ملخص الطلب :',
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('المجموع الفرعي',
                      style: AppStyles.regular13.copyWith(
                        color: Color(0xff4e5556),
                      )),
                  Text(
                      '${orderEntity.cartItems.getTotalCartCheckOutPrice()} جنيه',
                      style: AppStyles.semiBold13),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('التوصيل :',
                      style: AppStyles.regular13.copyWith(
                        color: Color(0xff4e5556),
                      )),
                  Text('30 جنيه', style: AppStyles.regular13),
                ],
              ),
              const SizedBox(height: 9),
              Divider(
                thickness: 0.5,
                color: Color(0xffcacece),
              ),
              const SizedBox(height: 9),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('الكلي :',
                      style: AppStyles.bold16.copyWith(
                        color: Color(0xff0c0d0d),
                      )),
                  Text(
                      '${orderEntity.cartItems.getTotalCartCheckOutPrice() + 30} جنيه',
                      style: AppStyles.bold16),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        PaymentItem(
            title: 'عنوان التوصيل :',
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'مدينة السادات , المنوفية , مصر',
                  style: AppStyles.semiBold13,
                ),
                Spacer(),
                Icon(
                  Icons.edit_location_outlined,
                  color: Color(0xff949d9e),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  'تعديل',
                  style: AppStyles.regular11.copyWith(color: Color(0xff949d9e)),
                )
              ],
            ))
      ],
    );
  }
}
