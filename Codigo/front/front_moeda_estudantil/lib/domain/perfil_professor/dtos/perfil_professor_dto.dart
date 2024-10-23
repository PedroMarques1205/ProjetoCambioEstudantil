class ProfessorDTO {
  final String nome;
  final String cpf;
  final String departamento;

  ProfessorDTO({
    required this.nome,
    required this.cpf,
    required this.departamento,
  });

  
  factory ProfessorDTO.fromJson(Map<String, dynamic> json) {
    return ProfessorDTO(
      nome: json['nome'],
      cpf: json['cpf'],
      departamento: json['departamento'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'cpf': cpf,
      'departamento': departamento,
    };
  }
}
