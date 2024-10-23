  import 'dart:convert';
import 'package:http/http.dart' as http;
import '../extratic_professor/dtos/extratic_professor_dto.dart';

class ExtractService {
  final String apiUrl = 'https://api.example.com/extract'; // URL da sua API

  Future<List<EnvioMoedaDTO>> fetchProfessorExtract() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => EnvioMoedaDTO.fromJson(e)).toList();
    } else {
      throw Exception('Erro ao carregar o extrato');
    }
  }
}
