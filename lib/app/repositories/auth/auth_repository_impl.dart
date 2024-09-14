import 'dart:developer';

import 'package:delivery_ka/app/core/exceptions/delivery_ka_repository_exception.dart';
import 'package:delivery_ka/app/core/exceptions/delivery_ka_unauthorized_exception.dart';
import 'package:delivery_ka/app/core/rest_client/custom_dio.dart';
import 'package:delivery_ka/app/models/auth_model.dart';
import 'package:dio/dio.dart';

import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio dio;

  AuthRepositoryImpl({
    required this.dio,
  });

  @override
  Future<AuthModel> login(String email, String password) async {
    try {
      final result = await dio.unauth().post('/auth', data: {
        'email': email,
        'password': password,
      });
      return AuthModel.fromMap(result.data);
    } on DioException catch (e, s) {
      if (e.response?.statusCode == 403) {
        log('Permissão negada', error: e, stackTrace: s);
        throw DeliveryKaUnauthorizedException();
      }
      log('Erro ao realizar login', error: e, stackTrace: s);
      throw DeliveryKaRepositoryException(message: 'Erro ao realizar login.');
    }
  }

  @override
  Future<void> register(String name, String email, String password) async {
    try {
      await dio.unauth().post('/users', data: {
        'name': name,
        'email': email,
        'password': password,
      });
    } on DioException catch (e, s) {
      log('Erro ao registrar usuario.', error: e, stackTrace: s);
      throw DeliveryKaRepositoryException(
          message: 'Erro ao registrar usuario.');
    }
  }
}
