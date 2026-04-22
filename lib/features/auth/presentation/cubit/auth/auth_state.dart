part of 'auth_cubit.dart';

sealed class AuthState {}
enum AuthStateSource { login, register }

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthAuthenticated extends AuthState {
  final String? uid;
  AuthStateSource source;

  AuthAuthenticated({required this.uid,required this.source});
}

final class AuthUnAuthenticated extends AuthState {}

final class AuthError extends AuthState {
  final String errMessage;

  AuthError({required this.errMessage});
}
