import 'package:crafty_bay_ecommerce/model/products%20model/product_details_by_id_model.dart';
import 'package:crafty_bay_ecommerce/utils/snackbar.dart';
import 'package:crafty_bay_ecommerce/utils/store_data_value.dart';
import 'package:get/get.dart';

import '../../../../services/products/create_cart_list.dart';
import '../../../../services/products/product_details_by_id.dart';
import '../../../../theme/app_colors.dart';
import '../../cart screen/controller/cart_screen_controller.dart';

class ProductDetailsScreenController extends GetxController {
  List<ProductDetailsModel> productDetailsById = [];
  final productId = Get.arguments;
  bool _isLoading = true;

  bool get isLoading => _isLoading;
  int colorIndex = 0;
  int sizeIndex = 0;
  int imageIndex = 0;
  int countProduct = 0;

  void increment() {
    if (countProduct == 5) {
      countProduct = 5;
      update();
    } else {
      countProduct++;
      update();
    }
  }

  void decrement() {
    if (countProduct == 0) {
      countProduct = 0;
      update();
    } else {
      countProduct--;
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
    productDetailsById
        .addAll(response.map((json) => ProductDetailsModel.fromJson(json)));
  }

  Future<void> fetchAndParseCreateCartList() async {
    if (UserData.userToken.isNotEmpty) {
      final response = await postCreateCartList({
        "product_id": productDetailsById[0].productId.toString(),
        "color": productDetailsById[0].color.toString(),
        "size": productDetailsById[0].size.toString()
      });
      if (response['msg'] == 'success') {
        Get.find<CartScreenController>().fetchAndParseCartList();
        SnackToast.requestSuccess();
      }
    } else {
      SnackToast.requestFailed();
    }
  }

  Future<void> handleDataCalling() async {
    await fetchAndParseProductDetailsById().then((value) {
      _isLoading = false;
      update();
    });
  }

  final List color = [
    AppColor.kPrimaryColor,
    AppColor.kBlueColor,
    AppColor.kRedColor,
    AppColor.kOrangeColor,
    AppColor.kGreyColor
  ];
  final List list = ['X', 'XL', '2L', 'XX'];

  @override
  void onInit() {
    handleDataCalling();
    super.onInit();
  }
}
