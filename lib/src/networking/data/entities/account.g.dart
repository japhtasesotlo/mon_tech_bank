// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
    id: json['id'] as int,
    name: json['name'] as String,
    balance: (json['balance'] as num)?.toDouble(),
    overdraft: (json['overdraft'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'balance': instance.balance,
      'overdraft': instance.overdraft,
    };
