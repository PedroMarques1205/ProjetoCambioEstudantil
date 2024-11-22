import '../../domain/vantagem/dtos/vantagem_dto.dart';

abstract class EmpresaState {}

class EmpresaInitial extends EmpresaState {}

class VantagensLoading extends EmpresaState {}

class VantagensLoaded extends EmpresaState {
  final List<VantagemDTO> vantagens;  

  VantagensLoaded(this.vantagens);
}

class VantagensError extends EmpresaState {
  final String message;

  VantagensError(this.message);
}
