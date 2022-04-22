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

class ProductDetailController extends GetxController {

  ProductDetailController();

  int _count = 1;

  int get count => _count;

  double _totalAmt=0.0;
  double get totalAmt=>_totalAmt;

  Future<void> increaseQty(double price) async {
    _count++;
    _totalAmt=price*_count;
    update();
  }

  Future<void> decreaseQty(double price) async {
    if(count>0){
      _count--;
      _totalAmt=price*_count;
      update();
    }

  }
}
