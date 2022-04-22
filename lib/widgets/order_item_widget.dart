import 'package:flutter/material.dart';
import 'package:user_stories/utils/app_constants.dart';
import 'package:user_stories/widgets/big_text.dart';
import 'package:user_stories/widgets/small_text.dart';

import '../models/cart.dart';
import '../utils/dimensions.dart';

class OrderItem extends StatelessWidget {
  final Cart cartItem;

  const OrderItem({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(Dimension.dimen10)),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(
          top: Dimension.dimen10 / 4, bottom: Dimension.dimen10 / 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // image
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimension.dimen20),
              color: Colors.white,
              image: DecorationImage(
                  image: NetworkImage(cartItem.image!), fit: BoxFit.cover),
            ),
            width: Dimension.dimen110,
            height: Dimension.dimen110,
          ),

          // text
          Expanded(
            child: Container(
              padding: EdgeInsets.all(Dimension.dimen10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SmallText(text: 'Product code :${cartItem.productId}'),
                  SizedBox(height: Dimension.dimen10),
                  BigText(
                      text: '${cartItem.qty} x ${cartItem.name}',
                      overflow: TextOverflow.visible,
                      size: Dimension.dimen16),
                  SizedBox(
                    height: Dimension.dimen10,
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              BigText(text: AppConstant.currencyFormat(cartItem.amount!)),
            ],
          )
        ],
      ),
    );
  }
}
