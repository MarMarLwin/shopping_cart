import 'package:get/get.dart';

import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class LoginRepo extends GetxService {
  final ApiClient apiClient;

  LoginRepo({required this.apiClient});

  Future<Response> login(String username,String password) async {
    return await apiClient.login(AppConstant.loginUrl,username,password);
  }


}
