import 'package:front_moeda_estudantil/domain/user/dtos/user_dto.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  final UserTypeEnum userType;

  LoginSuccess(this.userType);
}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure(this.error);
}

