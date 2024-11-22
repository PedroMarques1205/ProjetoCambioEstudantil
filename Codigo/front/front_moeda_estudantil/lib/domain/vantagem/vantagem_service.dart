import '../vantagem/client/vantagem_client.dart';
import '../vantagem/dtos/vantagem_dto.dart';

class VantagemService {
  final VantagemClient _vantagemClient;

  VantagemService(this._vantagemClient);

  Future<List<VantagemDTO>> obterVantagensPorEmpresa(String cnpj) async {
    try {
      final response = await _vantagemClient.obterVantagensPorEmpresa(cnpj);
      return response;
    } catch (e) {
      throw Exception('Erro ao obter vantagens');
    }
  }
}
