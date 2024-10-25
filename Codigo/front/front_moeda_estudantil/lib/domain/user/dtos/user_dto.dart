import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDTO {
  String? email;
  String? cpf;
  String? cnpj;
  String? rg;
  String? endereco;
  String? nome;
  String? senha;
  String? type;
  bool? ativo;
  double? saldoMoedas;

  UserDTO({
    this.email,
    this.cpf,
    this.cnpj,
    this.rg,
    this.endereco,
    this.nome,
    this.senha,
    this.type,
    this.ativo,
    this.saldoMoedas,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) => _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);
}

enum UserTypeEnum {
  @JsonValue('STUDENT')
  student,
  @JsonValue('TEACHER')
  teacher,
  @JsonValue('ENTERPRISE')
  enterprise
}
