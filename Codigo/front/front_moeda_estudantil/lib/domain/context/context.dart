import 'dart:math';
import 'package:dio/dio.dart';
import 'package:front_moeda_estudantil/domain/user/dtos/user_dto.dart';

class Context {
  static UserDTO currentUser = UserDTO();

  // CUIDADO: NAO TIRA O 'API' DA ROTA QUANDO FOR MUDAR AQUI

  // comando pra criar arquivos automaticos:
  // flutter pub run build_runner build

  // flutter pub run build_runner build

  static const baseUrl = 'http://localhost:8080/api';
  static final Dio dio = Dio(BaseOptions(baseUrl: baseUrl));

  static final int number = Random().nextInt(99) + 1; 
}