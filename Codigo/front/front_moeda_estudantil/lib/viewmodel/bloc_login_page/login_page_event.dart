abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String userType;

  LoginButtonPressed(this.userType);
}

class DoLoginEvent extends LoginEvent {
  final String usuario;
  final String senha;

  DoLoginEvent({required this.usuario, required this.senha});
}
