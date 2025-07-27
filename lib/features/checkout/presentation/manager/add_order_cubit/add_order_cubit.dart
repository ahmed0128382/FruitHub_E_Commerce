import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_hub/core/repos/orders_repo/orders_repo.dart';
import 'package:fruit_hub/features/checkout/domain/entities/order_entity.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this.ordersRepo) : super(AddOrderInitial());
  final OrdersRepo ordersRepo;

  Future<void> addOrder(OrderEntity orderEntity) async {
    emit(AddOrderLoading());
    final result = await ordersRepo.addOrder(orderEntity);
    result.fold(
      (failure) => emit(AddOrderFailure(errMessage: failure.message)),
      (success) => emit(AddOrderSuccess()),
    );
  }
}
