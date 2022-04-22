import 'package:json_annotation/json_annotation.dart';
import 'package:user_stories/models/category.dart';
part 'cart.g.dart';

@JsonSerializable()
class Cart{
  String? orderNumber;
  int? productId;
  String? image;
  String? name;
  double? amount;
  int? qty;

  Cart({required this.orderNumber,required this.productId,required this.image,required this.name,required this.amount,required this.qty});
  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
  Map<String, dynamic> toJson() => _$CartToJson(this);

}
