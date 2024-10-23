import 'dart:convert';
import 'package:http/http.dart' as http;
import '../professor_send_coins/dtos/professor_send_coins_dto.dart';

class CoinsService {
  final String apiUrl = 'https://api.example.com/send-coins'; // URL da API


  Future<void> sendCoins(SendCoinsDTO sendCoinsDTO) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(sendCoinsDTO.toJson()), 
    );

    if (response.statusCode != 200) {
      throw Exception('Erro ao enviar moedas');
    }
  }
}
