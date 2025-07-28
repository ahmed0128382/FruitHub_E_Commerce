import 'package:fruit_hub/core/helper/get_currency.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';

import 'details.dart';

class AmountEntity {
  String? total;
  String? currency;
  DetailsEntity? details;

  AmountEntity({this.total, this.currency, this.details});

  factory AmountEntity.fromOrderEntity(OrderEntity orderEntity) => AmountEntity(
        total: orderEntity.calculateTotalPriceAfterDiscount().toString(),
        currency: getCurrency(),
        details: DetailsEntity.fromOrderEntity(orderEntity),
      );

  factory AmountEntity.fromJson(Map<String, dynamic> json) => AmountEntity(
        total: json['total'] as String?,
        currency: json['currency'] as String?,
        details: json['details'] == null
            ? null
            : DetailsEntity.fromJson(json['details'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'total': total,
        'currency': currency,
        'details': details?.toJson(),
      };
}
