import 'package:get/get.dart';

import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class ProductRepo extends GetxService {
  final ApiClient apiClient;

  ProductRepo({required this.apiClient});

  Future<Response> getProducts(String page,String size) async {
    return await apiClient.getProducts('${AppConstant.productList}?page=$page&size=$size');
  }

}
