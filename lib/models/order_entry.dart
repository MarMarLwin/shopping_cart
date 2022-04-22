import 'package:json_annotation/json_annotation.dart';
import 'package:user_stories/models/category.dart';
part 'order_entry.g.dart';

@JsonSerializable()
class OrderEntry{
  int? productId;
  String? productName;
  double? amount;
  int? quantity;
  int? lineTotal;



  OrderEntry({required this.productId,required this.productName,required this.amount,required this.quantity,required this.lineTotal});
  factory OrderEntry.fromJson(Map<String, dynamic> json) => _$OrderEntryFromJson(json);
  Map<String, dynamic> toJson() => _$OrderEntryToJson(this);

}
