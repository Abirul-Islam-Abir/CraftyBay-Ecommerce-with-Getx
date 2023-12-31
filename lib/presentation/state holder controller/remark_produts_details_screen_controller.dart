import 'package:crafty_bay_ecommerce/data/utils/export.dart';
import '../../data/services/3 products list/product_details_by_id.dart';

class RemarkProductDetailsScreenController extends GetxController {
  final List<ProductDetailsModel> _productDetailsById = [];
  final productId = Get.arguments;
  bool _isLoading = true;
  bool get isLoading => _isLoading;
  List<ProductDetailsModel> get productDetailsById => _productDetailsById;

  int colorIndex = 0;
  int sizeIndex = 0;
  int imageIndex = 0;
  int _countProduct = 1;

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
    _productDetailsById.clear();
    _productDetailsById
        .addAll(response.map((json) => ProductDetailsModel.fromJson(json)));
  }



  Future<void> handleDataCalling() async {
    try {
      await Future.wait([
        fetchAndParseProductDetailsById(),
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

  final List size = [
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
