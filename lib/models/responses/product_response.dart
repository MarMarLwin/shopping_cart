import 'package:json_annotation/json_annotation.dart';
import 'package:user_stories/models/product.dart';
part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse{
  int? page;
  int? size;
  int? totalElements;
  int? totalPages;
  bool? last;
  List<Product>? content;

  ProductResponse();
  factory ProductResponse.fromJson(Map<String, dynamic> json) => _$ProductResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);

}
