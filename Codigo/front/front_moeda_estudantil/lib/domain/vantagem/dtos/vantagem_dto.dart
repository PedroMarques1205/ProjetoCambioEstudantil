import 'package:front_moeda_estudantil/domain/user/dtos/user_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vantagem_dto.g.dart';

@JsonSerializable()
class VantagemDTO {
  int? id;
  String? titulo;
  String? descricao;
  double? valor;
  UserDTO? empresaProvedor;

  VantagemDTO(
      {this.id, this.titulo, this.descricao, this.valor, this.empresaProvedor});

  factory VantagemDTO.fromJson(Map<String, dynamic> json) =>
      _$VantagemDTOFromJson(json);
  Map<String, dynamic> toJson() => _$VantagemDTOToJson(this);
}
