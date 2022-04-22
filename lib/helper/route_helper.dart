import 'package:get/get.dart';
import 'package:user_stories/pages/cart_page.dart';
import 'package:user_stories/pages/home_page.dart';
import 'package:user_stories/pages/login_page.dart';
import 'package:user_stories/pages/product_detail_page.dart';

class RouteHelper {
  static String initial = '/';
  static String login='/login';
  static String home='/home';
  static String productDetail='/productDetail';
  static String myCart='/myCart';

  static String getInitial()=>initial;
  static String getLogin()=>login;
  static String getHome()=>home;
  static String getProductDetail(int proudctId)=>'$productDetail?productId=$proudctId';
  static String getMyCart()=>myCart;

  static List<GetPage> routes = [
    GetPage(
        name: login,
        page: () {

          return  const LoginPage();
        },
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 700)),
    GetPage(
        name: home,
        page: () {
          return const HomePage();
        },
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 700)),
    GetPage(
        name: productDetail,
        page: () {
          var productId=Get.parameters['productId'];
          return ProductDetail(productId: int.parse(productId!));
        },
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 700)),
    GetPage(
        name: myCart,
        page: () {
          return const CartPage();
        },
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 700)),
  ];
}
