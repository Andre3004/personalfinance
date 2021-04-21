// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movel _$MovelFromJson(Map<String, dynamic> json) {
  return Movel(
    json['titulo'] as String,
    (json['preco'] as num)?.toDouble(),
    json['foto'] as String,
    json['descricao'] as String,
    quantidade: json['quantidade'] as int,
  );
}

Map<String, dynamic> _$MovelToJson(Movel instance) => <String, dynamic>{
      'titulo': instance.titulo,
      'preco': instance.preco,
      'foto': instance.foto,
      'descricao': instance.descricao,
      'quantidade': instance.quantidade,
    };
