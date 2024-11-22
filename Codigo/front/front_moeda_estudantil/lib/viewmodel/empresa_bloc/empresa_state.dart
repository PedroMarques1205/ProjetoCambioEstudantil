import '../../domain/vantagem/dtos/vantagem_dto.dart';
abstract class EmpresaState {}

class EmpresaInitial extends EmpresaState {}

class EmpresaLoading extends EmpresaState {}

class EmpresaLoaded extends EmpresaState {
  final List<VantagemDTO> vantagens;

  EmpresaLoaded(this.vantagens);
}

class EmpresaError extends EmpresaState {
  final String message;

  EmpresaError(this.message);
}
