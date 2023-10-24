import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../../../data/model/2 category list model/category_list_model.dart';
import '../../../../../../data/services/2 category list/category_list.dart';

class CategoriesScreenController extends GetxController {
  final List<CategoryListModel> _categoryList = [];

  List<CategoryListModel> get categoryList => _categoryList;

  //Get method
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  // Category list method
  Future<void> fetchAndParseCategoryList() async {
    List<Map<String, dynamic>> response = await fetchCategoryListRequest();

    _categoryList.clear(); // Clear the existing data before adding new data
    _categoryList.addAll(
      response.map(
        (json) => CategoryListModel.fromJson(json),
      ),
    );
  }

  Future initializeMethod() async {
    _isLoading = true;
    update();
    try {
      await Future.wait([
        fetchAndParseCategoryList(),
      ]);
    } catch (e) {
      throw Exception('Error fetching data :$e');
    } finally {
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