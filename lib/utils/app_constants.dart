import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:intl/intl.dart';

class AppConstant{
  static const String appName = 'Shopping';

  static const String appBaseUrl = 'https://assessment-api.hivestage.com';
  static const String loginUrl = '/api/auth/login';
  static const String productList='/api/products';
  static const String orderUrl='/api/orders';
  static const Transition PAGE_TRANSITION = Transition.cupertino;
  static const String decimalPlace='0';
  static const String dateFormat="dd MMM yyyy";

  static String currencyFormat(double currency) {
    final oCcy = NumberFormat(
        "#,##$decimalPlace MMK",
        "en_US");
    return oCcy.format(currency);
  }
  static Map<int, String> kSize = {0: 'S', 1: 'M', 2: 'L'};
  static Map<int, Color> kColor = {0: Colors.red, 1: Colors.green, 2: Colors.blue};

}
