import 'package:json_annotation/json_annotation.dart';
import 'package:user_stories/models/category.dart';
import 'package:user_stories/models/order_entry.dart';
part 'order.g.dart';

@JsonSerializable()
class Order{
  List<OrderEntry>? orderEntries;
  double? subTotal;
  double? tax;
  double? total;

  Order();
  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);

}
