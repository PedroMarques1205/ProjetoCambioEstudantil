import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_moeda_estudantil/domain/context/context.dart';
import 'package:front_moeda_estudantil/domain/user/dtos/user_dto.dart';
import 'package:front_moeda_estudantil/domain/user/user_service.dart';
import './login_page_event.dart';
import './login_page_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserService service = UserService();

  LoginBloc() : super(LoginInitial()) {
    on<DoLoginEvent>(_doLogin);
  }

  Future<void> _doLogin(DoLoginEvent event, Emitter<LoginState> emit) async {
    try {
      var user = await service.login(event.usuario, event.senha);
      Context.currentUser = user;
      print(user);
      emit(LoginSuccess(user.tipoAcesso ?? UserTypeEnum.student));
    } catch (error) {
      emit(LoginFailure('Erro ao logar. Verifique as credenciais de acesso.'));
    }
  }

 
}
