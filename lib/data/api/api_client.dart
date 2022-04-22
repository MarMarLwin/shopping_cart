
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/order.dart';


class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mapHeaders;


  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);

  }
  Future<Response> login(String uri,String username,String password) async {
    try {

      Response response = await post(uri,{
        'username': username,
        'password': password,
      });
      return response;
    } catch (e) {
      debugPrint(e.toString());

      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> getProducts(String uri) async{
    try {
      token=GetStorage().read('token')??'';
      _mapHeaders = {
        'Content-type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      };
      Response response = await get(uri,headers: _mapHeaders);
      return response;
    } catch (e) {
      debugPrint(e.toString());

      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> order(String uri,Order data) async{
    try {
      token=GetStorage().read('token')??'';
      _mapHeaders = {
        'Content-type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      };
      var body=data.toJson();
      print('order json :'+ body.toString());
      Response response = await post(uri,body,headers: _mapHeaders);
      return response;
    } catch (e) {
      debugPrint(e.toString());

      return Response(statusCode: 1, statusText: e.toString());
    }

  }
}
