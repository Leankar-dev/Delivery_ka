// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension OrderStateStatusMatch on OrderStateStatus {
  T match<T>({required T Function() initial, required T Function() loaded}) {
    final v = this;
    if (v == OrderStateStatus.initial) {
      return initial();
    }

    if (v == OrderStateStatus.loaded) {
      return loaded();
    }

    throw Exception('OrderStateStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loaded}) {
    final v = this;
    if (v == OrderStateStatus.initial && initial != null) {
      return initial();
    }

    if (v == OrderStateStatus.loaded && loaded != null) {
      return loaded();
    }

    return any();
  }
}
