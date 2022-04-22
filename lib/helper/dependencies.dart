
import 'package:get/get.dart';
import 'package:user_stories/controllers/cart_controller.dart';
import 'package:user_stories/controllers/login_controller.dart';
import 'package:user_stories/controllers/product_detail_controller.dart';
import 'package:user_stories/controllers/products_controller.dart';
import 'package:user_stories/data/repo/login_repo.dart';
import 'package:user_stories/data/repo/order_repo.dart';
import '../data/api/api_client.dart';
import '../data/repo/product_repo.dart';
import '../utils/app_constants.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstant.appBaseUrl));

  //repos
  Get.lazyPut(() => LoginRepo(apiClient: Get.find()));
  Get.lazyPut(()=> ProductRepo(apiClient:Get.find()));
  Get.lazyPut(()=>OrderRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => LoginController(repo: Get.find()));
  Get.lazyPut(() => ProductsController(repo: Get.find()));
  //Get.lazyPut(() => ProductDetailController());
  Get.lazyPut(() => CartController(repo: Get.find()));

}
