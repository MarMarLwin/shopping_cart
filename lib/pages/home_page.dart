import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:user_stories/controllers/cart_controller.dart';
import 'package:user_stories/controllers/login_controller.dart';
import 'package:user_stories/controllers/products_controller.dart';
import 'package:user_stories/utils/app_constants.dart';
import 'package:user_stories/utils/colors.dart';
import 'package:user_stories/widgets/big_text.dart';
import 'package:user_stories/widgets/cart_widget.dart';
import '../controllers/product_detail_controller.dart';
import '../helper/route_helper.dart';
import '../utils/dimensions.dart';
import '../widgets/input_text_widget.dart';

class HomePage extends GetView<ProductsController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getProducts(context);
    return Scaffold(
      body: GetBuilder(
        init: controller,
        builder: (_) {
          return Container(
            margin: EdgeInsets.only(
                top: Dimension.dimen30,
                left: Dimension.dimen15,
                right: Dimension.dimen15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        GetStorage().write('isLogin', false);
                        Get.lazyPut(() => LoginController(repo: Get.find()));
                        Get.offNamed(RouteHelper.getLogin());
                      },
                      child: Icon(Icons.menu_outlined,
                          color: primaryColor, size: Dimension.dimen30),
                    ),
                    GestureDetector(
                      child: const CartWidget(),
                      onTap: () {
                        Get.lazyPut(() => CartController(repo: Get.find()));
                        Get.toNamed(RouteHelper.getMyCart());
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: Dimension.dimen10,
                ),
                BigText(
                    text:
                        'Hello Kante, What fruit salad combo do you want today?',
                    size: Dimension.dimen20,
                    overflow: TextOverflow.visible),
                SizedBox(
                  height: Dimension.dimen10,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(Dimension.dimen10 / 2)),
                      color: Colors.black12),
                  child: textField(
                      controller: null,
                      keyBoard: TextInputType.text,
                      hintText: 'Search products...',
                      obscureText: false,
                      prefixIconData: Icons.search,
                      suffixIconData: null,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: Dimension.dimen15,
                      ),
                      focusBorderColor: Colors.transparent),
                ),
                SizedBox(
                  height: Dimension.dimen10,
                ),
                BigText(text: 'Recommended Products'),
                SizedBox(
                  height: Dimension.dimen10,
                ),
                Expanded(
                  child: SingleChildScrollView(
                      child: GetBuilder(
                          init: controller,
                          builder: (_) {
                            return controller.isLoading
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithMaxCrossAxisExtent(
                                            maxCrossAxisExtent:
                                                Dimension.dimen200,
                                            childAspectRatio: 1,
                                            crossAxisSpacing: 20,
                                            mainAxisSpacing: 20),
                                    itemCount: controller.productList.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () async {
                                          Get.lazyPut(
                                              () => ProductDetailController());
                                          Get.toNamed(
                                              RouteHelper.getProductDetail(
                                                  index));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      Dimension.dimen10)),
                                              color: Colors.white),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Stack(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              controller
                                                                  .productList[
                                                                      index]
                                                                  .image!),
                                                          fit: BoxFit.cover),
                                                    ),
                                                    width: Dimension.dimen200,
                                                    height: Dimension.dimen110,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {},
                                                    child: Align(
                                                        alignment:
                                                            Alignment.topRight,
                                                        child: Padding(
                                                            padding: EdgeInsets
                                                                .all(Dimension
                                                                    .dimen10),
                                                            child: Icon(
                                                                Icons
                                                                    .favorite_border,
                                                                size: Dimension
                                                                    .dimen20))),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: Dimension.dimen10,
                                                      right: Dimension.dimen10),
                                                  child: BigText(
                                                    text: controller
                                                        .productList[index]
                                                        .name!,
                                                    size: Dimension.dimen16,
                                                  )),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: Dimension.dimen10,
                                                    right: Dimension.dimen10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    BigText(
                                                      text: AppConstant
                                                          .currencyFormat(
                                                              controller
                                                                  .productList[index]
                                                                  .amount!),
                                                      size: Dimension.dimen16,
                                                    ),
                                                    const Icon(Icons.add_circle,
                                                        color: primaryColor)
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                          })),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
