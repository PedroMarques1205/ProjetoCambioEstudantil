import '../perfil_professor_service.dart';
import '../dtos/perfil_professor_dto.dart';

class ProfessorClient {
  final ProfessorService _service = ProfessorService();

  
  Future<ProfessorDTO> getProfessorProfile(int professorId) async {
    return await _service.fetchProfessorProfile(professorId);
  }
}
