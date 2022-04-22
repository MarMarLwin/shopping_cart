import 'package:json_annotation/json_annotation.dart';
part 'login_success_response.g.dart';

@JsonSerializable()
class LoginSuccessResponse{
  String? token;

  LoginSuccessResponse();
  factory LoginSuccessResponse.fromJson(Map<String, dynamic> json) => _$LoginSuccessResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginSuccessResponseToJson(this);

}
