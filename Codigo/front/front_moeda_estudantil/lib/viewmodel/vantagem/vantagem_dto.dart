class VantagemDTO {
  final String nome;
  final int custo;

  VantagemDTO({required this.nome, required this.custo});

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'custo': custo,
    };
  }
}
