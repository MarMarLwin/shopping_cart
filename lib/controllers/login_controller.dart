import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:user_stories/helper/route_helper.dart';
import 'package:user_stories/models/responses/login_success_response.dart';
import 'package:user_stories/models/responses/simple_response.dart';
import 'package:user_stories/utils/dialogs.dart';

import '../data/repo/login_repo.dart';

class LoginController extends GetxController{
  final LoginRepo repo;
  LoginController({required this.repo});

  bool isLoggedIn = false;
  bool passwordVisible = false;


  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login(BuildContext context) async{
    if (usernameController.text.toString().isEmpty) {
      showInfoDialog(context, null, 'Please enter your username');
      return;
    }

    if (passwordController.text.toString().isEmpty) {
      showInfoDialog(context, null, 'Please enter your password');
      return;
    }
    showLoading(context);
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
     Response response=await repo.login( usernameController.text, passwordController.text);
     if(response.statusCode==200){
       var responseBody=LoginSuccessResponse.fromJson(response.body);
       var cache=GetStorage();
       cache.write('isLogin', true);
       cache.write('token', responseBody.token);
       Get.back();
       debugPrint('successfully login');
       Get.offAllNamed(RouteHelper.home);
     }else{
       Get.back();
       var responseBody=SimpleResponse.fromJson(response.body);
       showInfoDialog(context, null,  responseBody.message?? 'Something wrong!',);
     }

     update();
    }
  }

  togglePassword() {
    passwordVisible = !passwordVisible;
    update();
  }
}
