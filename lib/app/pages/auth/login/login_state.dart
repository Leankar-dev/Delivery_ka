// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

part 'login_state.g.dart';

@match
enum LoginStateStatus {
  initial,
  login,
  success,
  loginError,
  error,
}

class LoginState extends Equatable {
  final LoginStateStatus status;
  final String errorMessage;

  const LoginState({
    required this.status,
    required this.errorMessage,
  });

  const LoginState.initial()
      : status = LoginStateStatus.initial,
        errorMessage = 'Error';

  @override
  List<Object> get props => [status, errorMessage];

  LoginState copyWith({
    LoginStateStatus? status,
    String? errorMessage,
  }) {
    return LoginState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
