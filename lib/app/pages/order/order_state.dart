// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

import 'package:delivery_ka/app/dto/order_product_dto.dart';
import 'package:delivery_ka/app/models/payment_type_model.dart';

part 'order_state.g.dart';

@match
enum OrderStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class OrderState extends Equatable {
  final OrderStateStatus status;
  final List<OrderProductDto> orderProducts;
  final List<PaymentTypeModel> paymentTypes;
  final String? erroMessage;

  const OrderState({
    required this.status,
    required this.orderProducts,
    required this.paymentTypes,
    this.erroMessage,
  });

  const OrderState.initial()
      : status = OrderStateStatus.initial,
        orderProducts = const [],
        paymentTypes = const [],
        erroMessage = null;

  @override
  List<Object> get props => [status, orderProducts, paymentTypes];

  OrderState copyWith({
    OrderStateStatus? status,
    List<OrderProductDto>? orderProducts,
    List<PaymentTypeModel>? paymentTypes,
    String? erroMessage,
  }) {
    return OrderState(
      status: status ?? this.status,
      orderProducts: orderProducts ?? this.orderProducts,
      paymentTypes: paymentTypes ?? this.paymentTypes,
      erroMessage: erroMessage ?? this.erroMessage,
    );
  }
}
