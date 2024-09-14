// vai centrarlizar todas as nossas requisições de autenticação

import 'package:delivery_ka/app/models/auth_model.dart';

abstract interface class AuthRepository {
  // vai cadastrar o usuario dentro do backend
  Future<void> register(String name, String email, String password);

  // vai efetuar o login
  Future<AuthModel> login(String email, String password);
}
