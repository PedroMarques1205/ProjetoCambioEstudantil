abstract class NovaVantagemEvent {}

class SalvarNovaVantagemEvent extends NovaVantagemEvent {
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
