import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/failure.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';

abstract class OrdersRepo {
  Future<Either<Failure, void>> addOrder(OrderEntity OrderEntity);
}
