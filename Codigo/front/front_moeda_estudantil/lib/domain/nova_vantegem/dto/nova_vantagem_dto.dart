class NovaVantagemDTO {
  final String titulo;
  final String descricao;
  final int valor;
  final String email;

  NovaVantagemDTO({
    required this.titulo,
    required this.descricao,
    required this.valor,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'descricao': descricao,
      'valor': valor,
      'empresaProvedor': {'email': email},
    };
  }

  static NovaVantagemDTO fromJson(Map<String, dynamic> json) {
    return NovaVantagemDTO(
      titulo: json['titulo'],
      descricao: json['descricao'],
      valor: json['valor'],
      email: json['empresaProvedor']['email'],
    );
  }
}
