import 'package:json_annotation/json_annotation.dart';
part 'simple_response.g.dart';

@JsonSerializable()
class SimpleResponse{
  String? message;

  SimpleResponse();
  factory SimpleResponse.fromJson(Map<String, dynamic> json) => _$SimpleResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SimpleResponseToJson(this);

}
