import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:user_stories/controllers/cart_controller.dart';
import 'package:user_stories/widgets/big_text.dart';
import 'package:user_stories/widgets/order_item_widget.dart';
import 'package:user_stories/widgets/small_text.dart';
import '../utils/app_constants.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';

class CartPage extends GetView<CartController> {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (_){
        return  Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: GestureDetector(
              child: const Icon(Icons.arrow_back_ios),
              onTap: () {
                Get.back(closeOverlays: true);
              },
            ),
            title: const Text('My Cart'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(Dimension.dimen10),
              child:controller.cart_count<1? Center(
                child: BigText(text: 'There is no item in this cart!',size: Dimension.dimen20,color: Colors.black38,),
              ): Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Delivery info
                  BigText(text: 'Delivery to'),
                  Container(
                    padding: EdgeInsets.all(Dimension.dimen10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(Dimension.dimen10 / 2)),
                        boxShadow: const [
                          BoxShadow(color: Colors.white, offset: Offset(0, 0))
                        ],color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(text: 'Home'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SmallText(text: 'No.225,Yadanar Street, Kamaryut Tsp'),
                            TextButton(
                                onPressed: null, child: SmallText(text: 'Edit'))
                          ],
                        ),
                      ],
                    ),
                  ),

                  //Order Info
                  BigText(text: 'Your Order'),
                  SizedBox(height: Dimension.dimen10),
                  SmallText(text: 'OrderID- #${controller.orderNo}', color: Colors.black38,size: Dimension.dimen16,),
                  SizedBox(
                    height: Dimension.dimen10 / 2,
                  ),
                  SmallText(text: 'Order Date - ${DateFormat('dd MMM yyyy').format(DateTime.now())}', color: Colors.black38,size: Dimension.dimen16,),

                  //Order Lists
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.cartItemList.length,
                      itemBuilder: (context, index) {
                        return OrderItem(
                          cartItem: controller.cartItemList[index],
                        );
                      }),

                  //sub total
                  SizedBox(height: Dimension.dimen10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigText(text: 'SubTotal'),
                      BigText(text: AppConstant.currencyFormat(controller.subTotal))
                    ],
                  ),
                  SizedBox(height: Dimension.dimen10),
                  //tax
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigText(text: 'Tax(5%)'),
                      BigText(text: AppConstant.currencyFormat(controller.tax))
                    ],
                  ),
                  SizedBox(height: Dimension.dimen10),
                  //grand total
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigText(text: 'Grand Total'),
                      BigText(text: AppConstant.currencyFormat(controller.grandTotal))
                    ],
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: Visibility(
            visible: controller.cart_count>0,
            child: Container(
              width: Get.width - Dimension.dimen30 * 2,
              height: Dimension.dimen50,
              margin: EdgeInsets.only(
                  bottom: 1, left: Dimension.dimen30, right: Dimension.dimen30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    BigText(
                      text: 'Check Out',
                      color: Colors.white,
                      size: Dimension.dimen16,
                    ),
                  ],
                ),
                onPressed: () {
                  controller.order(context);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
