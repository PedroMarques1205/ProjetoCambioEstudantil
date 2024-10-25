abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  final String userType;

  LoginSuccess(this.userType);
}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure(this.error);
}

