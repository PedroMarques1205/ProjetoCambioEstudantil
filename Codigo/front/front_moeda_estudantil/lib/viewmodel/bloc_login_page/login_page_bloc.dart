import 'package:flutter_bloc/flutter_bloc.dart';
import './login_page_event.dart';
import './login_page_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      // Aqui você pode implementar a lógica de autenticação
      // Simulando uma autenticação bem-sucedida
      await Future.delayed(Duration(seconds: 1)); // Simula um delay

      yield LoginSuccess(event.userType);
    }
  }
}
