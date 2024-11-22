import 'dart:convert';
import 'package:http/http.dart' as http;
import '../dto/nova_vantagem_dto.dart';

class NovaVantagemClient {
  final String baseUrl;

  NovaVantagemClient({required this.baseUrl});

  Future<bool> salvarNovaVantagem(NovaVantagemDTO vantagem) async {
    final url = Uri.parse('$baseUrl/vantagem/salvar');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(vantagem.toJson()),
    );

    return response.statusCode == 200;
  }
}
