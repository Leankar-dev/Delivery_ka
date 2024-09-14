// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

part 'register_state.g.dart';

@match
enum RegisterStateStatus {
  initial,
  register,
  success,
  error,
}

class RegisterState extends Equatable {
  final RegisterStateStatus status;

  const RegisterState({
    required this.status,
  });

  const RegisterState.initial() : status = RegisterStateStatus.initial;

  RegisterState copyWith({
    RegisterStateStatus? status,
  }) {
    return RegisterState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status];
}
