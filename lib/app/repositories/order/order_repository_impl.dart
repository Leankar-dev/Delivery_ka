import 'dart:developer';

import 'package:delivery_ka/app/core/exceptions/delivery_ka_repository_exception.dart';
import 'package:delivery_ka/app/core/rest_client/custom_dio.dart';
import 'package:delivery_ka/app/models/payment_type_model.dart';
import 'package:dio/dio.dart';

import './order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final CustomDio dio;

  OrderRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<PaymentTypeModel>> getAllPaymentsTypes() async {
    try {
      final result = await dio.auth().get('/payment-types');
      return result.data
          .map<PaymentTypeModel>((p) => PaymentTypeModel.fromMap(p))
          .toList();
    } on DioException catch (e, s) {
      log('Erro ao buscar formas de pagamento', error: e, stackTrace: s);
      throw DeliveryKaRepositoryException(
          message: 'Erro ao buscar formas de pagamento.');
    }
  }
}
