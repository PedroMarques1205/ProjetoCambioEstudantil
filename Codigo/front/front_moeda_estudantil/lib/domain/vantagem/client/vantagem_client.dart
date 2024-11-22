import 'package:http/http.dart' as http;
import 'dart:convert';
import '../dtos/vantagem_dto.dart';

class VantagemClient {
  final String baseUrl;

  // Construtor com parâmetro obrigatório baseUrl.
  VantagemClient({required this.baseUrl});

  Future<List<VantagemDTO>> obterVantagensPorEmpresa(String nomeOuCnpj) async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/vantagem/obterVantagensPorEmpresa?empresa=$nomeOuCnpj'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => VantagemDTO.fromJson(item)).toList();
    } else {
      throw Exception('Erro ao buscar vantagens: ${response.body}');
    }
  }
}
