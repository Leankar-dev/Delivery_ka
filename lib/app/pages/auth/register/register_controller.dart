// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:delivery_ka/app/pages/auth/register/register_state.dart';
import 'package:delivery_ka/app/repositories/auth/auth_repository.dart';

class RegisterController extends Cubit<RegisterState> {
  final AuthRepository _authRepository;

  RegisterController(
    this._authRepository,
  ) : super(const RegisterState.initial());

  // fazer a chamada
  Future<void> register(String name, String email, String password) async {
    try {
      emit(state.copyWith(status: RegisterStateStatus.register));
      await _authRepository.register(name, email, password);
      emit(state.copyWith(status: RegisterStateStatus.success));
    } catch (e, s) {
      log('Erro ao registrar usuario', error: e, stackTrace: s);
      emit(state.copyWith(status: RegisterStateStatus.error));
    }
  }
}
