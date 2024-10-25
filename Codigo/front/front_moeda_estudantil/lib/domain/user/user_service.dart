import 'package:front_moeda_estudantil/domain/context/context.dart';
import 'package:front_moeda_estudantil/domain/user/client/user_client.dart';
import 'package:front_moeda_estudantil/domain/user/dtos/user_dto.dart';

class UserService {
  final UserClient client = UserClient(Context.dio);

  Future<UserDTO> login(String usuario, String senha) async {
    var user = await client.login(usuario, senha);
    return user;
  }
}