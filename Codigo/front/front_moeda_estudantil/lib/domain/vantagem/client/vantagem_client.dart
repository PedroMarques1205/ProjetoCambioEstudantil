import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../dtos/vantagem_dto.dart';
part 'vantagem_client.g.dart';

@RestApi()
abstract class VantagemClient {
  factory VantagemClient(Dio dio) = _VantagemClient;

  @GET('/vantagem/obterVantagensPorEmpresa')
  Future<dynamic> obterVantagensPorEmpresa(
    @Query('cnpj') String cnpj,
  );
}
