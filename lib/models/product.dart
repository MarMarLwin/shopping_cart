import 'package:json_annotation/json_annotation.dart';
import 'package:user_stories/models/category.dart';
part 'product.g.dart';

@JsonSerializable()
class Product{
  int? id;
  String? image;
  String? createdDate;
  String? name;
  double? amount;
  String? description;
  Category? category;



  Product();
  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);

}
