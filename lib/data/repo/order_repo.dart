import 'package:get/get.dart';

import '../../models/order.dart';
import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class OrderRepo extends GetxService {
  final ApiClient apiClient;

  OrderRepo({required this.apiClient});

  Future<Response> order(Order orders) async {
    return await apiClient.order(AppConstant.orderUrl,orders);
  }

}
