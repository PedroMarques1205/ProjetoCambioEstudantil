import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_moeda_estudantil/domain/context/context.dart';
import 'package:front_moeda_estudantil/domain/user/dtos/user_dto.dart';
import 'package:front_moeda_estudantil/domain/user/user_service.dart';
import 'package:front_moeda_estudantil/viewmodel/register_page/register_page_event.dart';
import 'package:front_moeda_estudantil/viewmodel/register_page/register_page_state.dart';

class RegisterPageBloc extends Bloc<RegisterPageEvent, RegisterPageState> {
  final UserService service = UserService();

  RegisterPageBloc() : super(RegisterPageInitState()) {
    on<RegisterUserEvent>(_onRegister);
  }

  Future<void> _onRegister(
      RegisterUserEvent event, Emitter<RegisterPageState> emit) async {
    try {
      var req = UserDTO();
      if (event.type == UserTypeEnum.ENTERPRISE.name) {
        req = UserDTO(cnpj: event.cnpj, senha: event.senha, tipoAcesso: UserTypeEnum.ENTERPRISE, email: event.email);
      } else {
        req = UserDTO(
            email: event.email,
            cpf: event.cpf,
            rg: event.rg,
            endereco: event.endereco,
            nome: event.nome,
            senha: event.senha,
            tipoAcesso: event.type == UserTypeEnum.TEACHER.name
                ? UserTypeEnum.TEACHER
                : UserTypeEnum.STUDENT);
      }

      var user = await service.register(req);
      Context.currentUser = user;
      emit(RegisterSuccessState());
    } catch (error) {
      print(error);
      emit(RegisterErrorState());
    }
  }
}
