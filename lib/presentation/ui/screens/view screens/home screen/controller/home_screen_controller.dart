import '../../../../../../data/model/3 products list/list_product_by_brand_model.dart';
import '../../../../../../data/model/6 user profile/read_profile.dart';
import '../../../../../../data/utils/export.dart';

class HomeScreenController extends GetxController {
  final List<ListProductByBrandModel> _listProductByBrand = [];
  final List<ReadProfileModel> _readProfile = [];
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  List<ListProductByBrandModel> get listProductByBrand => _listProductByBrand;

  List<ReadProfileModel> get readProfile => _readProfile;

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

  Future<void> fetchAndParseReadProfile() async {
    List<Map<String, dynamic>> response = await readProfileRequest();
    _readProfile.clear();
    _readProfile.addAll(
      response.map(
        (json) => ReadProfileModel.fromJson(json),
      ),
    );
  } //Wish list

  Future<void> initializeMethod() async {
    _isLoading = true;
    update();
    try {
      await Future.wait([
        fetchAndParseListProductByBrand(),
      ]);
    } catch (e) {
      throw Exception('Error fetching data :$e');
    } finally {
      fetchUserData();
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

  void fetchUserData() {
    final tokenData = storageInstance.read(StorageKey.setTokenKey);
    final emailData = storageInstance.read(StorageKey.setEmailKey);
    if (tokenData != null && emailData != null) {
      UserData.userToken = tokenData;
      UserData.userEmail = emailData;
      fetchAndParseReadProfile();
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
