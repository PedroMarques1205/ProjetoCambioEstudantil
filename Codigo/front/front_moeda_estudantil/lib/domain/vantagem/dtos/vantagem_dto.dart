class VantagemDTO {
  final String titulo;
  final String descricao;
  final int valor;

  VantagemDTO({
    required this.titulo,
    required this.descricao,
    required this.valor,
  });

  factory VantagemDTO.fromJson(Map<String, dynamic> json) {
    return VantagemDTO(
      titulo: json['titulo'] as String,
      descricao: json['descricao'] as String,
      valor: json['valor'] as int,
    );
  }
}
