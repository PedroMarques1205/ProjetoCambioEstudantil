class VantagemDTO {
  final String nome;
  final int custo;

  VantagemDTO({required this.nome, required this.custo});

  factory VantagemDTO.fromJson(Map<String, dynamic> json) {
    return VantagemDTO(
      nome: json['nome'] as String,
      custo: json['custo'] as int,
    );
  }
}
