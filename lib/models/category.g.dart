// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category()
  ..id = json['id'] as int?
  ..createdDate = json['createdDate'] as String?
  ..name = json['name'] as String?;

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate,
      'name': instance.name,
    };
