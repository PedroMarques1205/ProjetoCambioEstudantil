import 'package:front_moeda_estudantil/domain/context/context.dart';
import 'package:front_moeda_estudantil/domain/user/client/user_client.dart';
import 'package:front_moeda_estudantil/domain/user/dtos/user_dto.dart';

class UserService {
  final UserClient client = UserClient(Context.dio);

  Future<UserDTO> login(String usuario, String senha) async {
    var user = await client.login(usuario, senha);
    return user;
  }

  Future<UserDTO> register(UserDTO newUser) async {
    var resp = await client.register(newUser);
    return resp;
  }

  Future<UserDTO> update(UserDTO user) async {
    var resp = await client.update(user);
    return resp;
  }
}
