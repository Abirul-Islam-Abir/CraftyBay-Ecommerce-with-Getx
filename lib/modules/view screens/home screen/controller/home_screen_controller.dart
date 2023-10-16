import 'dart:async';
import 'package:crafty_bay_ecommerce/model/products%20model/list_product_by_brand_model.dart';
import 'package:crafty_bay_ecommerce/model/products%20model/list_product_slider_model.dart';
import 'package:crafty_bay_ecommerce/model/user%20model/read_profile.dart';
import 'package:crafty_bay_ecommerce/utils/export.dart';
import 'package:crafty_bay_ecommerce/utils/storage_key.dart';
import 'package:crafty_bay_ecommerce/utils/store_data_value.dart';
import '../../../../model/products model/product_wish_list_model.dart';
import '../../../../services/products/list_porduct_slider.dart';
import '../../../../services/products/list_product_by_brand.dart';
import '../../../../services/products/product_wish_list.dart';
import '../../../../services/user/read_profile.dart';

class HomeScreenController extends GetxController {
  final List<ListProductSliderModel> _listProductSlider = [];
  final List<ListProductByBrandModel> _listProductByBrand = [];
  final List<ReadProfileModel> _readProfile = [];
  final List<ProductWishListModel> _wishList = []; //Get method
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  List<ListProductSliderModel> get listProductSlider => _listProductSlider;

  List<ListProductByBrandModel> get listProductByBrand => _listProductByBrand;

  List<ReadProfileModel> get readProfile => _readProfile;

  List<ProductWishListModel> get wishList => _wishList;
  final TextEditingController searchController = TextEditingController();

  Future<void> fetchAndParseListProductSlider() async {
    List<Map<String, dynamic>> response = await fetchListProductSliderRequest();
    _listProductSlider.clear();
    _listProductSlider
        .addAll(response.map((json) => ListProductSliderModel.fromJson(json)));
  }

  Future<void> fetchAndParseListProductByBrand() async {
    List<Map<String, dynamic>> response =
        await fetchListProductByBrandRequest();
    _listProductByBrand.clear();
    _listProductByBrand.addAll(
      response.map(
        (json) => ListProductByBrandModel.fromJson(json),
      ),
    );
  } //Read profile

  Future<void> fetchAndParseReadProfile() async {
    List<Map<String, dynamic>> response = await readProfileRequest();
    _readProfile.clear();
    _readProfile.addAll(
      response.map(
        (json) => ReadProfileModel.fromJson(json),
      ),
    );
  } //Wish list

  Future<void> fetchAndParseWishList() async {
    List<Map<String, dynamic>> response = await fetchProductWishList();
    _wishList.clear();
    _wishList
        .addAll(response.map((json) => ProductWishListModel.fromJson(json)));
  }

  Future<void> initializeMethod() async {
    _isLoading = true;
    update();
    try {
      await Future.wait([
        fetchAndParseListProductSlider(),
        fetchAndParseListProductByBrand(),
      ]);
    } catch (e) {
      ('Error fetching data :$e');
    } finally {
      fetchUserData();
      _isLoading = false;
      update();
    }
  }

  int carouselCurrentIndex = 0;

  void carouselSelectedIndex(index) {
    carouselCurrentIndex = index;
    update();
  }

  void fetchUserData() {
    final tokenData = storageInstance.read(StorageKey.setTokenKey);
    final emailData = storageInstance.read(StorageKey.setEmailKey);
    if (tokenData != null && emailData != null) {
      UserData.userToken = tokenData;
      UserData.userEmail = emailData;
      fetchAndParseReadProfile();
      fetchAndParseWishList();
    }
  }

  void isCheckLoggedIn() {
    if (UserData.userToken.isEmpty) {
      Get.toNamed(RouteName.emailVerifyScreen);
    } else {
      Get.defaultDialog(
          title: 'Oh!',
          content: const Text('Wait some times.Its a Technical problem'),
          barrierDismissible: false,
          onCancel: () {});
    }
  }

  @override
  void onInit() {
    initializeMethod();
    super.onInit();
  }
}
