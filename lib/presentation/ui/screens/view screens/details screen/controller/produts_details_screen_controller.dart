import 'package:crafty_bay_ecommerce/data/services/7%20review%20list/list_product_by_review.dart';
import 'package:crafty_bay_ecommerce/data/utils/export.dart';
import '../../../../../../data/model/7 review list/list_product_by_review_model.dart';
import '../../../../../../data/services/9 cart list/create_cart_list.dart';
import '../../../../../../data/services/3 products list/product_details_by_id.dart';

class ProductDetailsScreenController extends GetxController {
  final List<ProductDetailsModel> _productDetailsById = [];
  final List<ListProductByReviewModel> _productListByReview = [];
  final productId = Get.arguments;
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  List<ProductDetailsModel> get productDetailsById => _productDetailsById;

  List<ListProductByReviewModel> get productListByReview =>
      _productListByReview;
  int colorIndex = 0;
  int sizeIndex = 0;
  int imageIndex = 0;
  int _countProduct = 0;

  int get countProduct => _countProduct;

  void increment() {
    if (countProduct == 5) {
      _countProduct = 5;
      update();
    } else {
      _countProduct++;
      update();
    }
  }

  void decrement() {
    if (countProduct == 0) {
      _countProduct = 0;
      update();
    } else {
      _countProduct--;
      update();
    }
  }

  void colorSelect(index) {
    colorIndex = index;
    update();
  }

  void sizeSelect(index) {
    sizeIndex = index;
    update();
  }

  void imageSelect(index) {
    imageIndex = index;
    update();
  }

  //Product Details By Id method
  Future<void> fetchAndParseProductDetailsById() async {
    List<Map<String, dynamic>> response =
        await fetchProductDetailsByIdRequest(productId);
    _productDetailsById
        .addAll(response.map((json) => ProductDetailsModel.fromJson(json)));
  }

  Future<void> fetchAndParseListProductByReview() async {
    List<Map<String, dynamic>> response =
        await fetchListProductByReviewRequest(productId);
    _productListByReview.addAll(
        response.map((json) => ListProductByReviewModel.fromJson(json)));
  }

  Future<void> handleDataCalling() async {
    try {
      await Future.wait([
        fetchAndParseProductDetailsById(),
        fetchAndParseListProductByReview(),
      ]);
    } catch (e) {
      SnackToast.requestFailed();
    } finally {
      _isLoading = false;
      update();
    }
  }

  final List<Map<String, dynamic>> color = [
    {
      'color': AppColor.kGreenColor,
      'name': 'Green',
    },
    {
      'color': AppColor.kBlueColor,
      'name': 'Blue',
    },
    {
      'color': AppColor.kRedColor,
      'name': 'Red',
    },
  ];

  final List list = [
    'X',
    'XL',
    '2L',
    'XX',
  ];

  @override
  void onInit() {
    super.onInit();
    handleDataCalling();
  }
}
