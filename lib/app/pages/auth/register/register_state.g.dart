// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension RegisterStateStatusMatch on RegisterStateStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() register,
      required T Function() success,
      required T Function() error}) {
    final v = this;
    if (v == RegisterStateStatus.initial) {
      return initial();
    }

    if (v == RegisterStateStatus.register) {
      return register();
    }

    if (v == RegisterStateStatus.success) {
      return success();
    }

    if (v == RegisterStateStatus.error) {
      return error();
    }

    throw Exception(
        'RegisterStateStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? register,
      T Function()? success,
      T Function()? error}) {
    final v = this;
    if (v == RegisterStateStatus.initial && initial != null) {
      return initial();
    }

    if (v == RegisterStateStatus.register && register != null) {
      return register();
    }

    if (v == RegisterStateStatus.success && success != null) {
      return success();
    }

    if (v == RegisterStateStatus.error && error != null) {
      return error();
    }

    return any();
  }
}
