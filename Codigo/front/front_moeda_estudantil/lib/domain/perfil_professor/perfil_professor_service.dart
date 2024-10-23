import 'dart:convert';
import 'package:http/http.dart' as http;
import './dtos/perfil_professor_dto.dart';

class ProfessorService {
  final String apiUrl = 'https://api.example.com/professores'; //trocar pela rota certa

  Future<ProfessorDTO> fetchProfessorProfile(int professorId) async {
    final response = await http.get(Uri.parse('$apiUrl/$professorId'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return ProfessorDTO.fromJson(data);
    } else {
      throw Exception('Erro ao carregar os dados do professor');
    }
  }
}
