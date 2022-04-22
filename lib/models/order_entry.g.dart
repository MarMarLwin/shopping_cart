// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderEntry _$OrderEntryFromJson(Map<String, dynamic> json) => OrderEntry(
      productId: json['productId'] as int?,
      productName: json['productName'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      quantity: json['quantity'] as int?,
      lineTotal: json['lineTotal'] as int?,
    );

Map<String, dynamic> _$OrderEntryToJson(OrderEntry instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'amount': instance.amount,
      'quantity': instance.quantity,
      'lineTotal': instance.lineTotal,
    };
