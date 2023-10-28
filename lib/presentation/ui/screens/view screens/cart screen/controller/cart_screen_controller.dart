import 'package:get/get.dart';

import '../../../../../../data/model/9 cart list/cart_list_model.dart';
import '../../../../../../data/routes/app_route_name.dart';
import '../../../../../../data/services/9 cart list/cart_list.dart';
import '../../../../../../data/services/9 cart list/create_cart_list.dart';
import '../../../../../../data/services/9 cart list/delete_cart_list.dart';
import '../../../../../../data/utils/snackbar.dart';
import '../../../../../../data/utils/storage_key.dart';
import '../../../../../../data/utils/store_data_value.dart';

class CartScreenController extends GetxController {
  final List<CartListModel> _cartList = [];

  List<CartListModel> get cartList => _cartList;
  bool _isLoading = true;

  bool get isLoading => _isLoading;

//Cart List method
  Future<void> fetchAndParseCartList() async {
    List<Map<String, dynamic>> response = await fetchCartListRequest();
    _cartList.clear();
    _cartList.addAll(response.map((json) => CartListModel.fromJson(json)));
  }

  Future<void> fetchAndParseCreateCartList(
      {productDetailsById, colorIndex, sizeIndex, countProduct}) async {
    final response = await postCreateCartList({
      "product_id": productDetailsById[0].productId.toString(),
      "color": productDetailsById[0].color?[colorIndex].toString(),
      "size": productDetailsById[0].size?[sizeIndex].toString(),
      "qty": countProduct.toString()
    });
    if (response['msg'] == 'success') {
      Get.find<CartScreenController>().initializeMethod();
      SnackToast.requestSuccess();
    }
  }

  Future<void> deleteItems(id) async {
    _isLoading = false;
    update();
    final response = await postDeleteCartList(id);
    if (response['msg'] == 'success') {
      await Future.wait([
        fetchAndParseCartList(),
      ]);

      SnackToast.cartOperationSuccessful();
    } else {
      SnackToast.cartOperationFailed();
    }
  }

  Future<void> initializeMethod() async {
    _isLoading = true;
    update();
    try {
      await Future.wait([
        fetchAndParseCartList(),
      ]);
    } catch (e) {
      if (UserData.userToken.isNotEmpty) {
        storageInstance.remove(StorageKey.setTokenKey);
        Get.offAllNamed(RouteName.emailVerifyScreen);
      }

      throw Exception('Error fetching data :$e');
    } finally {
      _isLoading = false;
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
    initializeMethod();
  }
}
