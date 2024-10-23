import '../dtos/extratic_professor_dto.dart';
import '../extratic_professor_service.dart';

class ExtractClient {
  final ExtractService _extractService;

  ExtractClient(this._extractService);

  Future<List<EnvioMoedaDTO>> getProfessorExtract() {
    return _extractService.fetchProfessorExtract();
  }
}
