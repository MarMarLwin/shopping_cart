import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:user_stories/data/repo/order_repo.dart';
import 'package:user_stories/models/product.dart';
import "package:collection/collection.dart";
import '../helper/route_helper.dart';
import '../models/cart.dart';
import '../models/order.dart';
import '../models/order_entry.dart';
import '../utils/dialogs.dart';
import '../widgets/order_confirm_popup.dart';

class CartController extends GetxController {
  OrderRepo repo;

  CartController({required this.repo});

  int _cart_count = 0;

  int get cart_count => _cart_count;

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  List<Cart> _cartItemList = [];

  List<Cart> get cartItemList => _cartItemList;


  double _tax = 0.0;

  double get tax => _tax;

  double _subTotal = 0.0;

  double get subTotal => _subTotal;

  double _grandTotal = 0.0;

  double get grandTotal => _grandTotal;

  String _orderNo = '12345';

  String get orderNo => _orderNo;

  Future<void> addToCart(Product product, int _qty) async {

    Cart cart = Cart(
        productId: product.id,
        image: product.image,
        name: product.name,
        amount: product.amount,
        qty: _qty,
        orderNumber: _orderNo);


      if (_cartItemList.any((element) => element.productId == cart.productId)) {
        for (var item in _cartItemList) {
          if (item.productId == cart.productId) {
            item.qty = item.qty! + cart.qty!;
            item.amount = item.amount! + cart.amount!;
          }
        }
      } else {
        _cartItemList.add(cart);
      }


    _subTotal = _subTotal + (cart.amount! * cart.qty!);
    _tax = _subTotal * 0.05;
    _grandTotal = _subTotal + _tax;

    // increase cart count;
    _cart_count += _qty;
    update();
  }

  Future<void> order(BuildContext context) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var orderData = Order();
      List<OrderEntry> entries = [];

      for (var entry in _cartItemList) {
        var orderEntry = OrderEntry(
            productId: entry.productId,
            productName: entry.name,
            amount: entry.amount,
            quantity: entry.qty,
            lineTotal: _cartItemList.length);
        entries.add(orderEntry);
      }
      orderData.orderEntries = entries;
      orderData.tax = _tax;
      orderData.total = _grandTotal;
      orderData.subTotal = _subTotal;

      showLoading(context);

      Response response = await repo.order(orderData);

      if (response.statusCode == 200) {

        var responseBody = Cart.fromJson(response.body);

        _orderNo = responseBody.orderNumber!;

        //hide loading
        Get.back();

        //show popup dialog
        var dialog = AlertDialog(
            content: OrderConfirmPopup(
          orderNo: _orderNo,
        ));
        showDialog(
          context: context,
          builder: (_) => dialog,
          barrierDismissible: false,
        ).then((value) {
          _cartItemList.clear();
        });

        _cart_count=0;
        _subTotal=0.0;
        _tax=0.0;
        _grandTotal=0.0;

      } else {
        Get.back();
        showInfoDialog(context, null,  response.toString());
      }

      update();
    }
  }
}
