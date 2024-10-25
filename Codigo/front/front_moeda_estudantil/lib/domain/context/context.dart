import 'package:dio/dio.dart';
import 'package:front_moeda_estudantil/domain/user/dtos/user_dto.dart';

class Context {
  static UserDTO currentUser = UserDTO();

  // CUIDADO: NAO TIRA O 'API' DA ROTA QUANDO FOR MUDAR AQUI

  // comando pra criar arquivos automaticos:
  // flutter pub run build_runner build

  static const baseUrl =
      'https://ab05-2804-14c-5bd2-86e4-105d-8445-87d7-5d27.ngrok-free.app/api';
  static final Dio dio = Dio(BaseOptions(baseUrl: baseUrl));
}
