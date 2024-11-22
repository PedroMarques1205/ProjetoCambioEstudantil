abstract class EmpresaEvent {}

class FetchVantagensEvent extends EmpresaEvent {
  final String nomeOuCnpj;

  FetchVantagensEvent(this.nomeOuCnpj);
}
