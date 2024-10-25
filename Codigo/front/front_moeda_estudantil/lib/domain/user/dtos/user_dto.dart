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

  @JsonKey(fromJson: _tipoAcessoFromJson)
  UserTypeEnum? tipoAcesso;

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
    this.tipoAcesso,
    this.ativo,
    this.saldoMoedas,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);
  Map<String, dynamic> toJson() => _$UserDTOToJson(this);

  static UserTypeEnum? _tipoAcessoFromJson(String? tipo) {
    switch (tipo?.toUpperCase()) {
      case 'STUDENT':
        return UserTypeEnum.STUDENT;
      case 'TEACHER':
        return UserTypeEnum.TEACHER;
      case 'ENTERPRISE':
        return UserTypeEnum.ENTERPRISE;
      default:
        return null;
    }
  }
}

enum UserTypeEnum { STUDENT, TEACHER, ENTERPRISE }
