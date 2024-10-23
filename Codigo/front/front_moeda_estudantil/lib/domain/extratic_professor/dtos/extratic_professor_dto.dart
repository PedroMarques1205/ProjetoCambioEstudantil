class EnvioMoedaDTO {
  final String matricula;
  final int quantidade;
  final String motivo;

  EnvioMoedaDTO({
    required this.matricula,
    required this.quantidade,
    required this.motivo,
  });

  factory EnvioMoedaDTO.fromJson(Map<String, dynamic> json) {
    return EnvioMoedaDTO(
      matricula: json['matricula'],
      quantidade: json['quantidade'],
      motivo: json['motivo'],
    );
  }
}
