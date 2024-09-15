import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:delivery_ka/app/dto/order_product_dto.dart';
import 'package:delivery_ka/app/pages/order/order_state.dart';
import 'package:delivery_ka/app/repositories/order/order_repository.dart';
import 'package:dio/dio.dart';

class OrderController extends Cubit<OrderState> {
  final OrderRepository _orderRepository;

  OrderController(this._orderRepository) : super(const OrderState.initial());

  Future<void> load(List<OrderProductDto> products) async {
    try {
      emit(state.copyWith(status: OrderStateStatus.loading));
      final paymentTypes = await _orderRepository.getAllPaymentsTypes();
      emit(
        state.copyWith(
          orderProducts: products,
          status: OrderStateStatus.loaded,
          paymentTypes: paymentTypes,
        ),
      );
    } catch (e, s) {
      log('Erro ao carregar pagina', error: e, stackTrace: s);
      emit(state.copyWith(
          status: OrderStateStatus.error,
          erroMessage: 'Erro ao carregar Página.'));
    }
  }
}
