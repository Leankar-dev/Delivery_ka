// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:delivery_ka/app/core/exceptions/delivery_ka_unauthorized_exception.dart';
import 'package:delivery_ka/app/pages/auth/login/login_state.dart';
import 'package:delivery_ka/app/repositories/auth/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginController(
    this._authRepository,
  ) : super(const LoginState.initial());

  Future<void> login(String email, String password) async {
    try {
      emit(state.copyWith(status: LoginStateStatus.login));
      final authModel = await _authRepository.login(email, password);
      final sp = await SharedPreferences.getInstance();
      sp.setString('accessToken', authModel.accessToken);
      sp.setString('refreshToken', authModel.refreshToken);
      emit(state.copyWith(status: LoginStateStatus.success));
    } on DeliveryKaUnauthorizedException catch (e) {
      log('Login e Password invalidos', error: e);
      emit(state.copyWith(
          status: LoginStateStatus.loginError,
          errorMessage: 'Login ou Password invalidos'));
    } catch (e, s) {
      log('Erro a realizar login', error: e, stackTrace: s);
      emit(state.copyWith(
          status: LoginStateStatus.error,
          errorMessage: 'Erro ao realizar login'));
    }
  }
}
