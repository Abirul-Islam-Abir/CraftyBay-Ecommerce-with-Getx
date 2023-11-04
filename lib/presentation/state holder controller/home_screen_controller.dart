import '../../data/model/3 products list/list_product_by_brand_model.dart';
import '../../data/utils/export.dart';
import '../../data/utils/utils.dart';

class HomeScreenController extends GetxController {
  final List<ListProductByBrandModel> _listProductByBrand = [];

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  List<ListProductByBrandModel> get listProductByBrand => _listProductByBrand;

  final TextEditingController searchController = TextEditingController();

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

  Future<void> initializeMethod() async {
    _isLoading = true;
    update();
    try {
      await Future.wait([
        fetchAndParseListProductByBrand(),
         Utils.fetchUserData()

      ]);
    } catch (e) {
      throw Exception('Error fetching data :$e');
    } finally {

      _isLoading = false;
      update();
    }
  }

  void isDarkModeChanger() {
    if (Get.isDarkMode) {
      Get.changeTheme(ThemeData.light());
    } else {
      Get.changeTheme(ThemeData.dark());
    }
  }

  void isCheckLoggedIn() {
    if (BoxDataStore.userToken.isEmpty) {
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
    super.onInit();
    initializeMethod();
    print(BoxDataStore.userToken);
  }
}
