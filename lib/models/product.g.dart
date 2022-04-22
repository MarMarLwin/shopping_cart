// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product()
  ..id = json['id'] as int?
  ..image = json['image'] as String?
  ..createdDate = json['createdDate'] as String?
  ..name = json['name'] as String?
  ..amount = (json['amount'] as num?)?.toDouble()
  ..description = json['description'] as String?
  ..category = json['category'] == null
      ? null
      : Category.fromJson(json['category'] as Map<String, dynamic>);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'createdDate': instance.createdDate,
      'name': instance.name,
      'amount': instance.amount,
      'description': instance.description,
      'category': instance.category,
    };
