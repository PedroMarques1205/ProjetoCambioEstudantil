import 'package:front_moeda_estudantil/domain/login_page/dtos/user_dto.dart';

class Context {
  static final currentUser = UserDTO(
    name: 'Juliana da Silva',
    email: 'juliana@helena.app',
    type: UserTypeEnum.student
  );
}