// auth_state.dart

abstract class AuthState {}

class AuthInitial extends AuthState {}

class SignUpLoadingState extends AuthState {}

class SignUpSuccessState extends AuthState {}

class SignUpFieldState extends AuthState {
  final String errorMessage;

  SignUpFieldState({required this.errorMessage});
}
