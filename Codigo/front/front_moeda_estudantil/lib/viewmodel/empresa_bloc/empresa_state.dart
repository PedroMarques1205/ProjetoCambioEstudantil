import 'package:front_moeda_estudantil/viewmodel/empresa_bloc/empresa_event.dart';

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

class SalvarNovaVantagemEvent extends EmpresaEvent {
  final String titulo;
  final String descricao;
  final String valor;
  final String email;

  SalvarNovaVantagemEvent({
    required this.titulo,
    required this.descricao,
    required this.valor,
    required this.email,
  });
}
