import '../nova_vantegem/client/nova_vantagem_client.dart';
import '../nova_vantegem/dto/nova_vantagem_dto.dart';

class NovaVantagemService {
  final NovaVantagemClient client;

  NovaVantagemService(novaVantagemClient, {required this.client});

  Future<bool> salvarNovaVantagem(NovaVantagemDTO vantagem) async {
    return await client.salvarNovaVantagem(vantagem);
  }
}
