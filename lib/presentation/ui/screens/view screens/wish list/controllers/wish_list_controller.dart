import 'package:get/get.dart';

import '../../../../../../data/model/8 wish list/product_wish_list_model.dart';
import '../../../../../../data/services/8 wish list/product_wish_list.dart';
import '../../../../../../data/utils/store_data_value.dart';

class WishListScreenController extends GetxController {
  final List<ProductWishListModel> _wishList = [];

  List<ProductWishListModel> get wishList => _wishList;
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  Future<void> fetchAndParseWishList() async {
    List<Map<String, dynamic>> response = await fetchProductWishList();
    print(response);
    _wishList.clear();
    _wishList
        .addAll(response.map((json) => ProductWishListModel.fromJson(json)));
  }

  Future initializeMethod() async {
    _isLoading = true;
    update();
    try {
      if (UserData.userToken.isNotEmpty) {
        await Future.wait([
          fetchAndParseWishList(),
        ]);
      }
    } catch (e) {
      throw Exception('Error fetching data :$e');
    } finally {
      _isLoading = false;
      update();
    }
  }

  @override
  void onInit() {

    super.onInit();initializeMethod();
  }
}
