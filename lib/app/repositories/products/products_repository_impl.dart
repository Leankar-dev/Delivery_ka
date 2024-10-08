import 'dart:developer';

import 'package:delivery_ka/app/core/exceptions/delivery_ka_repository_exception.dart';
import 'package:delivery_ka/app/core/rest_client/custom_dio.dart';
import 'package:delivery_ka/app/models/product_model.dart';
import 'package:dio/dio.dart';

import './products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final CustomDio dio;

  ProductsRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<ProductModel>> findAllProducts() async {
    try {
      final result = await dio.unauth().get('/products');
      return result.data
          .map<ProductModel>(
            (p) => ProductModel.fromMap(p),
          )
          .toList();
    } on DioException catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      throw DeliveryKaRepositoryException(message: 'Ero ao Buscar produtos.');
    }
  }
}


