// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => UserDTO(
      email: json['email'] as String?,
      cpf: json['cpf'] as String?,
      cnpj: json['cnpj'] as String?,
      rg: json['rg'] as String?,
      endereco: json['endereco'] as String?,
      nome: json['nome'] as String?,
      senha: json['senha'] as String?,
      tipoAcesso: UserDTO._tipoAcessoFromJson(json['tipoAcesso'] as String?),
      ativo: json['ativo'] as bool?,
      saldoMoedas: (json['saldoMoedas'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) => <String, dynamic>{
      'email': instance.email,
      'cpf': instance.cpf,
      'cnpj': instance.cnpj,
      'rg': instance.rg,
      'endereco': instance.endereco,
      'nome': instance.nome,
      'senha': instance.senha,
      'tipoAcesso': _$UserTypeEnumEnumMap[instance.tipoAcesso],
      'ativo': instance.ativo,
      'saldoMoedas': instance.saldoMoedas,
    };

const _$UserTypeEnumEnumMap = {
  UserTypeEnum.STUDENT: 'STUDENT',
  UserTypeEnum.TEACHER: 'TEACHER',
  UserTypeEnum.ENTERPRISE: 'ENTERPRISE',
};
