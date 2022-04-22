import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:user_stories/data/repo/product_repo.dart';
import 'package:user_stories/helper/route_helper.dart';
import 'package:user_stories/models/product.dart';
import 'package:user_stories/models/responses/login_success_response.dart';
import 'package:user_stories/models/responses/product_response.dart';
import 'package:user_stories/models/responses/simple_response.dart';
import 'package:user_stories/utils/dialogs.dart';

import '../data/repo/login_repo.dart';

class ProductsController extends GetxController {
  final ProductRepo repo;

  ProductsController({required this.repo});

  bool _isLoading = true;

  bool get isLoading => _isLoading;
  int _page = 0;
  var _totalPage = 1;

  int get page => _page;
  int _count = 0;

  int get count => _count;

  List<Product> _productList = [];

  List<Product> get productList => _productList;

  Future<void> getProducts(BuildContext context) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      while (_page < _totalPage) {
        Response response = await repo.getProducts(_page.toString(), '6');
        if (response.statusCode == 200) {
          var responseBody = ProductResponse.fromJson(response.body);
          _productList.addAll(responseBody.content!);
          _totalPage = responseBody.totalPages!;
        } else {
          Get.back();
          var responseBody = SimpleResponse.fromJson(response.body);
          showInfoDialog(
            context,
            null,
            responseBody.message ?? 'Something wrong!',
          );
        }
        _isLoading = false;
        _page++;
        update();
      }
    }
  }

  Future<void> addToCart() async {
    _count++;
  }

  Future<void> removeFromCart() async {
    _count--;
  }
}
