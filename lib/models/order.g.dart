// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order()
  ..orderEntries = (json['orderEntries'] as List<dynamic>?)
      ?.map((e) => OrderEntry.fromJson(e as Map<String, dynamic>))
      .toList()
  ..subTotal = (json['subTotal'] as num?)?.toDouble()
  ..tax = (json['tax'] as num?)?.toDouble()
  ..total = (json['total'] as num?)?.toDouble();

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'orderEntries': instance.orderEntries,
      'subTotal': instance.subTotal,
      'tax': instance.tax,
      'total': instance.total,
    };
