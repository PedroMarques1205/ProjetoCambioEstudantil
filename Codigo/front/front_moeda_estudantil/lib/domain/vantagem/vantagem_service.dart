import '../vantagem/client/vantagem_client.dart';
import '../vantagem/dtos/vantagem_dto.dart';

class VantagemService {
  final VantagemClient client;

  // Construtor com injeção do VantagemClient.
  VantagemService(this.client);

  Future<List<VantagemDTO>> fetchVantagens(String nomeOuCnpj) {
    return client.obterVantagensPorEmpresa(nomeOuCnpj);
  }
}
