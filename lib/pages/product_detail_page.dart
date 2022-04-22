import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_stories/controllers/cart_controller.dart';
import 'package:user_stories/controllers/product_detail_controller.dart';
import 'package:user_stories/controllers/products_controller.dart';
import 'package:user_stories/utils/app_constants.dart';
import 'package:user_stories/widgets/product_item_tab.dart';
import '../helper/route_helper.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../widgets/big_text.dart';

class ProductDetail extends StatelessWidget {
  final int productId;

  const ProductDetail({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<ProductsController>().productList[productId];
    return GetBuilder<ProductDetailController>(builder: (controller) {
      return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child:
                        const Icon(Icons.arrow_back_ios, color: primaryColor),
                    onTap: () {
                      Get.back(closeOverlays: true);
                    },
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Get.toNamed(RouteHelper.myCart);
                  //   },
                  //   child: CartWidget(),
                  // )
                ],
              ),

              //product name and qty
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(Dimension.dimen30),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimension.dimen20),
                          topLeft: Radius.circular(Dimension.dimen20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigText(
                        text: product.name!,

                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: Dimension.dimen10,
                            right: Dimension.dimen10,
                            bottom: Dimension.dimen10 / 2,
                            top: Dimension.dimen10 / 2),
                        color: primaryColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              child:const Icon(Icons.remove, color: Colors.white),
                              onTap: () {
                                controller.decreaseQty(product.amount!);
                              },
                            ),
                            SizedBox(width: Dimension.dimen10),
                            BigText(
                                text: controller.count.toString(),
                                color: Colors.white),
                            SizedBox(width: Dimension.dimen10),
                            GestureDetector(
                              child:const Icon(Icons.add, color: Colors.white),
                              onTap: () {
                                controller.increaseQty(product.amount!);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                      top: Dimension.dimen10 / 2,
                      bottom: Dimension.dimen10,
                      left: Dimension.dimen20,
                      right: Dimension.dimen20),
                ),
              ),

              backgroundColor: primaryColor,
              shadowColor: Colors.transparent,
              expandedHeight: Dimension.dimen300,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  product.image!,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(child: ProductItemTab(product: product))
          ],
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(Dimension.dimen20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: BigText(
                        text: controller.totalAmt == 0.0
                            ? AppConstant.currencyFormat(product.amount!)
                            : AppConstant.currencyFormat(controller.totalAmt)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimension.dimen10),
                        color: Colors.white),
                    padding: EdgeInsets.all(Dimension.dimen15),
                  ),
                  GetBuilder<CartController>(builder: (cartController) {
                    return GestureDetector(
                      onTap: () {

                        cartController.addToCart(product, controller.count);
                        Get.offAndToNamed(RouteHelper.getMyCart());
                       // showSnackBar(context, 'Added to cart.');
                      },
                      child: Container(
                        height: Dimension.dimen50,
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                            left: Dimension.dimen10, right: Dimension.dimen10),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimension.dimen10/2),
                            color: primaryColor),
                        child: BigText(
                          text: 'Add To Cart',
                          color: Colors.white,
                          size: Dimension.dimen16,
                        ),
                      ),
                    );
                  })
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
