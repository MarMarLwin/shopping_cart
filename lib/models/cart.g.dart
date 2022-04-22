// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
      orderNumber: json['orderNumber'] as String?,
      productId: json['productId'] as int?,
      image: json['image'] as String?,
      name: json['name'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      qty: json['qty'] as int?,
    );

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'orderNumber': instance.orderNumber,
      'productId': instance.productId,
      'image': instance.image,
      'name': instance.name,
      'amount': instance.amount,
      'qty': instance.qty,
    };
