import 'package:get/get.dart';

import '../../../../../../data/model/9 cart list/cart_list_model.dart';
import '../../../../../../data/services/9 cart list/cart_list.dart';
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

  Future<void> fetchUserData() async {
    final tokenData = storageInstance.read(StorageKey.setTokenKey);
    final emailData = storageInstance.read(StorageKey.setEmailKey);
    if (tokenData != null && emailData != null) {
      UserData.userToken = tokenData;
      UserData.userEmail = emailData;
      await Future.wait([
        fetchAndParseCartList(),
      ]);
    }
  }

  Future<void> deleteItems(id) async {
    final response = await postDeleteCartList(id);
    if (response['msg'] == 'success') {
      await Future.wait([
        fetchAndParseCartList(),
      ]);
      update();
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
        fetchUserData(),
      ]);
    } catch (e) {
      // Handle errors, e.g., show a snack-bar or an error message
      throw Exception('Error fetching data :$e');
    } finally {
      fetchUserData();
      _isLoading = false;
      update();
    }
  }

  @override
  void onInit() {
    initializeMethod();
    super.onInit();
  }
}
