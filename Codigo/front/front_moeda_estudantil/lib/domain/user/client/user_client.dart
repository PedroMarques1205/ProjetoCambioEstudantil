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
}
