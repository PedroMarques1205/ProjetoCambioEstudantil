// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vantagem_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VantagemDTO _$VantagemDTOFromJson(Map<String, dynamic> json) => VantagemDTO(
      id: (json['id'] as num?)?.toInt(),
      titulo: json['titulo'] as String?,
      descricao: json['descricao'] as String?,
      valor: (json['valor'] as num?)?.toDouble(),
      empresaProvedor: json['empresaProvedor'] == null
          ? null
          : UserDTO.fromJson(json['empresaProvedor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VantagemDTOToJson(VantagemDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titulo': instance.titulo,
      'descricao': instance.descricao,
      'valor': instance.valor,
      'empresaProvedor': instance.empresaProvedor,
    };
