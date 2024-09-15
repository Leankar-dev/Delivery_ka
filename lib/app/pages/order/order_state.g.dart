// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension OrderStateStatusMatch on OrderStateStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() loaded,
      required T Function() error}) {
    final v = this;
    if (v == OrderStateStatus.initial) {
      return initial();
    }

    if (v == OrderStateStatus.loading) {
      return loading();
    }

    if (v == OrderStateStatus.loaded) {
      return loaded();
    }

    if (v == OrderStateStatus.error) {
      return error();
    }

    throw Exception('OrderStateStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? loaded,
      T Function()? error}) {
    final v = this;
    if (v == OrderStateStatus.initial && initial != null) {
      return initial();
    }

    if (v == OrderStateStatus.loading && loading != null) {
      return loading();
    }

    if (v == OrderStateStatus.loaded && loaded != null) {
      return loaded();
    }

    if (v == OrderStateStatus.error && error != null) {
      return error();
    }

    return any();
  }
}
