import 'package:get/get_connect/http/src/response/response.dart';
import 'package:loading_more_list/loading_more_list.dart';
import 'package:user_stories/data/repo/product_repo.dart';

import '../../models/product.dart';
import '../../models/responses/product_response.dart';

class ProductLoadMoreRepo extends LoadingMoreBase<Product> {
  final ProductRepo repo;

  ProductLoadMoreRepo({required this.repo});

  int pageindex = 1;
  bool _hasMore = true;
  bool forceRefresh = false;
  @override
  bool get hasMore => (_hasMore && length <6) || forceRefresh;

  @override
  Future<bool> refresh([bool clearBeforeRequest = false]) async {
    _hasMore = true;
    pageindex = 1;
    //force to refresh list when you don't want clear list before request
    //for the case, if your list already has 20 items.
    forceRefresh = !clearBeforeRequest;
    var result = await super.refresh(clearBeforeRequest);
    forceRefresh = false;
    return result;
  }

  @override
  Future<bool> loadData([bool isloadMoreAction = false]) async {
    bool isSuccess = false;
    try {
    Response response = await repo.getProducts(pageindex.toString(), '6');
    if (response.statusCode == 200) {
      var responseBody = ProductResponse.fromJson(response.body);

      if (pageindex == 1) {
        this.clear();
      }
      for (var item in responseBody.content!) {
        if (!this.contains(item) && hasMore) {
          this.add(item);
        }
      }
      _hasMore = responseBody.content!.isNotEmpty;
      pageindex++;
      isSuccess = true;
    }

    } catch (exception, stack) {
      isSuccess = false;
      print(exception);
      print(stack);
    }
    return isSuccess;
  }
}
