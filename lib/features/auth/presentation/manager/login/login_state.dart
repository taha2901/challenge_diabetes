

import 'package:challenge_diabetes/features/auth/data/auth.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoaded extends LoginState {}

final class LoginSuccess extends LoginState {
  final Auth login;

  LoginSuccess(this.login);
}

final class LoginFailure extends LoginState {
  final String errMessage;

  LoginFailure(this.errMessage);
}

final class LoginchangePasswordVisibility extends LoginState {}