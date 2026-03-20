part of 'auth_cubit.dart';

enum AuthSource { Login, Register }
@immutable

 abstract class AuthState{}

final class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}
 class AuthAuthenticated extends AuthState {
  final User user;
  final AuthSource source;
  AuthAuthenticated({required this.user, required this.source});
}

class AuthUnAuthenticated extends AuthState {}

class AuthError extends AuthState {
  final String errMessage;
  AuthError({required this.errMessage});
}
