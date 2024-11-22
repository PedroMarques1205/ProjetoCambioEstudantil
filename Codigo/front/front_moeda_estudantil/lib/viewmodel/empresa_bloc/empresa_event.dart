abstract class EmpresaEvent {}

class FetchVantagensEvent extends EmpresaEvent {
  final String cnpj;

  FetchVantagensEvent(this.cnpj);

  @override
  List<Object> get props => [cnpj];
}