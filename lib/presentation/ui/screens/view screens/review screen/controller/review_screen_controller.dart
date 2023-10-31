import 'package:crafty_bay_ecommerce/data/services/7%20review%20list/list_product_by_review.dart';
import 'package:get/get.dart';

import '../../../../../../data/model/7 review list/list_product_by_review_model.dart';
import '../../../../../../data/utils/snackbar.dart';

class ReviewScreenController extends GetxController {
  final productId = Get.arguments;

  final List<ListProductByReviewModel> _productListByReview = [];

  List<ListProductByReviewModel> get productListByReview =>
      _productListByReview;
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  Future<void> fetchAndParseListProductByReview() async {
    List<Map<String, dynamic>> response =
        await fetchListProductByReviewRequest(productId);
    print(response);
    _productListByReview.clear();
    _productListByReview.addAll(
        response.map((json) => ListProductByReviewModel.fromJson(json)));
  }

  Future handleDataCalling() async {
    try {
     await Future.wait([
        fetchAndParseListProductByReview(),
      ]);
    } catch (e) {
      SnackToast.requestFailed();
    } finally {
      _isLoading = false;
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    handleDataCalling();
  }
}
