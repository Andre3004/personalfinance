// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return Transaction(
    json['id'] as String,
    (json['value'] as num).toDouble(),
    Contact.fromJson(json['contact'] as Map<String, dynamic>),
    json['dateTime'] == null
        ? null
        : DateTime.parse(json['dateTime'] as String),
  );
}

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'dateTime': instance.dateTime?.toIso8601String(),
      'contact': instance.contact,
    };
