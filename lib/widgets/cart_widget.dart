import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:user_stories/controllers/cart_controller.dart';
import 'package:user_stories/utils/colors.dart';
import 'package:user_stories/widgets/big_text.dart';

import '../utils/dimensions.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (cart) {
      return Stack(
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            color: primaryColor,
            size: Dimension.dimen40,
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Visibility(
              visible: cart.cart_count > 0,
              child: Container(
                width: Dimension.dimen20,
                height: Dimension.dimen20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimension.dimen20 / 2),
                    color: Colors.red),
                child: Center(
                    child: BigText(
                        text: cart.cart_count.toString(),
                        color: Colors.white,
                        size: Dimension.dimen16)),
              ),
            ),
          )
        ],
      );
    });
  }
}
