// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:delivery_ka/app/dto/order_product_dto.dart';

part 'order_state.g.dart';

@match
enum OrderStateStatus {
  initial,
  loaded,
}

class OrderState extends Equatable {
  final OrderStateStatus status;
  final List<OrderProductDto> orderProducts;

  const OrderState({
    required this.status,
    required this.orderProducts,
  });

  const OrderState.initial()
      : status = OrderStateStatus.initial,
        orderProducts = const [];

  @override
  List<Object> get props => [status, orderProducts];

  OrderState copyWith({
    OrderStateStatus? status,
    List<OrderProductDto>? orderProducts,
  }) {
    return OrderState(
      status: status ?? this.status,
      orderProducts: orderProducts ?? this.orderProducts,
    );
  }
}
