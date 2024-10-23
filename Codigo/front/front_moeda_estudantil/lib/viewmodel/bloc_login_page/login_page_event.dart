abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String userType;

  LoginButtonPressed(this.userType);
}
