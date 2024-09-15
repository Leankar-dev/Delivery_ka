import 'package:delivery_ka/app/models/payment_type_model.dart';

abstract interface class OrderRepository {
  Future<List<PaymentTypeModel>> getAllPaymentsTypes();
}
