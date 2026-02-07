part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final User user;
  AuthAuthenticated({required this.user});
}

class AuthUnAuthenticated extends AuthState {}
class AuthError extends AuthState {
  final String errMessage;
  AuthError({required this.errMessage});
}

