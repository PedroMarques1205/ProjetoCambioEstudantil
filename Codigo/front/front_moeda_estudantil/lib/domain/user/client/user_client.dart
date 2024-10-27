import 'package:front_moeda_estudantil/domain/user/dtos/user_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'user_client.g.dart';

@RestApi()
abstract class UserClient {
  factory UserClient(Dio dio, {String baseUrl}) = _UserClient;

  @GET('/usuario/login')
  Future<UserDTO> login(
    @Query('usuario') String usuario,
    @Query('senha') String senha,
  );

  @POST('/usuario/novoUsuario')
  Future<UserDTO> register(@Body() UserDTO req);

  @POST('/usuario/editarUsuario')
  Future<UserDTO> update(@Body() UserDTO req);

  @GET('/usuario/obterUsuariosPorTipoAcesso')
  Future<List<UserDTO>> getByType(@Query('usuario') String usuario);

  @DELETE('/usuario/deletarUsuario')
  Future<void> delete(@Body() String user);
}
