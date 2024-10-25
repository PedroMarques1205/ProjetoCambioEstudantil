import 'package:front_moeda_estudantil/domain/user/dtos/user_dto.dart';

abstract class EmpresaDetalhesEvent {}

class EmpresaDetalhesUpdateEvent extends EmpresaDetalhesEvent {
    final UserDTO user;

  EmpresaDetalhesUpdateEvent({required this.user});
}