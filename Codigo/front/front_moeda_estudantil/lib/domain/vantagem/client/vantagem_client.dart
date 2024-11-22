import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../dtos/vantagem_dto.dart';
import 'package:dio/dio.dart';
import '../dtos/vantagem_dto.dart';
part 'vantagem_client.g.dart';

@RestApi()
abstract class VantagemClient {
  factory VantagemClient(Dio dio) = _VantagemClient;

  @GET('/vantagem/obterVantagensPorEmpresa')
  Future<List<VantagemDTO>> obterVantagensPorEmpresa(
    @Query('cnpj') String cnpj,
  );
}


// class VantagemClient {
//   final Dio _dio;

//   VantagemClient(this._dio);

//   // Método para buscar vantagens por CNPJ
//   Future<List<VantagemDTO>> obterVantagensPorEmpresa(String cnpj) async {
//     try {
//       final response = await _dio.get('/vantagens/$cnpj');
//       if (response.statusCode == 200) {
//         return (response.data as List)
//             .map((item) => VantagemDTO.fromJson(item))
//             .toList();
//       } else {
//         // Adicionando mais detalhes para a depuração
//         throw Exception('Erro ao buscar vantagens, status: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Exibindo detalhes do erro
//       throw Exception('Erro ao buscar vantagens: $e');
//     }
//   }
// }
