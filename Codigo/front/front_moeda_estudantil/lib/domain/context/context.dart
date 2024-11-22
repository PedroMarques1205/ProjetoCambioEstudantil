import 'dart:math';
import 'package:dio/dio.dart';
import 'package:front_moeda_estudantil/domain/user/dtos/user_dto.dart';

class Context {
  static UserDTO currentUser = UserDTO();

  // CUIDADO: NAO TIRA O 'API' DA ROTA QUANDO FOR MUDAR AQUI

  // comando pra criar arquivos automaticos:
  // flutter pub run build_runner build

  // flutter pub run build_runner build

  static const baseUrl = 'https://cf23-2804-14c-5b81-48f7-557b-7e51-a7b9-1c58.ngrok-free.app/api';
  static final Dio dio = Dio(BaseOptions(baseUrl: baseUrl));

  static final int number = Random().nextInt(99) + 1; 
}