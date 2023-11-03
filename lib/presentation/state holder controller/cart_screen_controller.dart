
import 'package:crafty_bay_ecommerce/presentation/state%20holder%20controller/create_invoice_controller.dart';

import '../../data/model/9 cart list/cart_list_model.dart';
import '../../data/services/9 cart list/cart_list.dart';
import '../../data/services/9 cart list/create_cart_list.dart';
import '../../data/services/9 cart list/delete_cart_list.dart';
import '../../data/utils/export.dart';

class CartScreenController extends GetxController {
  final List<CartListModel> _cartList = [];
  bool _isLoading = true;
  bool _isCartAdd = false;
  bool get isLoading => _isLoading;
  List<CartListModel> get cartList => _cartList;
  bool get isCartAdd => _isCartAdd;

//Cart List method
  Future<void> fetchAndParseCartList() async {
    List<Map<String, dynamic>> response = await fetchCartListRequest();
    _cartList.clear();
    _cartList.addAll(response.map((json) => CartListModel.fromJson(json)));
  }

  Future<void> fetchAndParseCreateCartList(
      {productDetailsById, color, size, countProduct}) async {
    isCartAddTrue();
    final Map<String, String> body = {
      "product_id": productDetailsById[0].productId.toString(),
      "color": color.toString(),
      "size": size.toString(),
      "qty": countProduct.toString()
    };
    final response = await postCreateCartList(body);
    if (response['msg'] == 'success') {
      initializeMethod();
      SnackToast.requestSuccess();
    } else {
      isCartAddFalse();
      SnackToast.cartOperationFailed();
    }
  }
  void isLoadingFalse() {
    _isLoading = false;
    update();
  }

  void isLoadingTrue() {
    _isLoading = true;
    update();
  }

  void isCartAddFalse() {
    _isCartAdd = false;
    update();
  }

  void isCartAddTrue() {
    _isCartAdd = true;
    update();
  }


  Future<void> deleteItems(id) async {
    isLoadingTrue();
    final response = await postDeleteCartList(id);
    if (response['msg'] == 'success') {
      initializeMethod();
      SnackToast.cartItemDelete()();
    } else {
      isLoadingFalse();
      SnackToast.cartOperationFailed();
    }
  }

  Future<void> initializeMethod() async {
    isLoadingTrue();
    try {
      await Future.wait([
        fetchAndParseCartList(),
        Get.find<CreateInvoiceController>().fetchAndParseCreateInvoice(),
      ]);
    } catch (e) {
      /* if (UserData.userToken.isNotEmpty) {
        storageInstance.remove(StorageKey.setTokenKey);
        Get.offAllNamed(RouteName.emailVerifyScreen);
      }*/

      throw Exception('Error fetching data :$e');
    } finally {
      isLoadingFalse();
      isCartAddFalse();
    }
  }

  void showDeleteDialog(id) {
    Get.defaultDialog(
      title: "Confirm Delete",
      middleText: "Are you sure you want to delete this product?",
      textConfirm: "Delete",
      textCancel: "Cancel",
      buttonColor: AppColor.kRedColor,
      confirmTextColor: Colors.white,

      cancelTextColor: Colors.blue,

      onConfirm: () {
        deleteItems(id);
        Get.back();
      },
      onCancel: () {
        Get.back();
      },
    );
  }




  @override
  void onInit() {
    super.onInit();
   // Timer.periodic(Duration(seconds: 1), (timer) {update() ;});
    initializeMethod();
  }
}
