// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension LoginStateStatusMatch on LoginStateStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() login,
      required T Function() success,
      required T Function() loginError,
      required T Function() error}) {
    final v = this;
    if (v == LoginStateStatus.initial) {
      return initial();
    }

    if (v == LoginStateStatus.login) {
      return login();
    }

    if (v == LoginStateStatus.success) {
      return success();
    }

    if (v == LoginStateStatus.loginError) {
      return loginError();
    }

    if (v == LoginStateStatus.error) {
      return error();
    }

    throw Exception('LoginStateStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? login,
      T Function()? success,
      T Function()? loginError,
      T Function()? error}) {
    final v = this;
    if (v == LoginStateStatus.initial && initial != null) {
      return initial();
    }

    if (v == LoginStateStatus.login && login != null) {
      return login();
    }

    if (v == LoginStateStatus.success && success != null) {
      return success();
    }

    if (v == LoginStateStatus.loginError && loginError != null) {
      return loginError();
    }

    if (v == LoginStateStatus.error && error != null) {
      return error();
    }

    return any();
  }
}
