
import '../professor_send_coins_service.dart';
import '../dtos/professor_send_coins_dto.dart';

class CoinsClient {
  final CoinsService _service = CoinsService();
  
  Future<void> sendCoins({
    required String matricula,
    required int quantidade,
    required String motivo,
  }) async {
    SendCoinsDTO sendCoinsDTO = SendCoinsDTO(
      matricula: matricula,
      quantidade: quantidade,
      motivo: motivo,
    );

    await _service.sendCoins(sendCoinsDTO);
  }
}
