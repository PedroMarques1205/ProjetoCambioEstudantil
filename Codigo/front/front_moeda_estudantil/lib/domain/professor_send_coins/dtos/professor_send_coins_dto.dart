class SendCoinsDTO {
  final String matricula;
  final int quantidade;
  final String motivo;

  SendCoinsDTO({
    required this.matricula,
    required this.quantidade,
    required this.motivo,
  });

  Map<String, dynamic> toJson() {
    return {
      'matricula': matricula,
      'quantidade': quantidade,
      'motivo': motivo,
    };
  }
  factory SendCoinsDTO.fromJson(Map<String, dynamic> json) {
    return SendCoinsDTO(
      matricula: json['matricula'],
      quantidade: json['quantidade'],
      motivo: json['motivo'],
    );
  }
}
