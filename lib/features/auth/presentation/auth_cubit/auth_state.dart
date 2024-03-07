// auth_state.dart

abstract class AuthState {}

class AuthInitial extends AuthState {}

class SignUpLoadingState extends AuthState {}

class SignUpSuccessState extends AuthState {}

class SignUpFieldState extends AuthState {
  final String errorMessage;
  SignUpFieldState({required this.errorMessage});
}

class StatusBox extends AuthState {}

class SignInLoadingState extends AuthState {}

class SignInSuccessState extends AuthState {}

class SignInFieldState extends AuthState {
  final String errorMessage;
  SignInFieldState({required this.errorMessage});
}

class ForgotPasswordLoadingState extends AuthState {}

class ForgotPasswordSuccessState extends AuthState {}

class ForgotPasswordFieldState extends AuthState {
  final String errorMessage;
  ForgotPasswordFieldState({required this.errorMessage});
}
