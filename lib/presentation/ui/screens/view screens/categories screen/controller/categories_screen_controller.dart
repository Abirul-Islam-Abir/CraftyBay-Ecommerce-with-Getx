import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../../../data/model/category list model/category_list_model.dart';
import '../../../../../../data/model/products model/list_product_by_category_model.dart';
import '../../../../../../data/services/2 category list/category_list.dart';
import '../../../../../../data/services/3 products list/list_product_by_category.dart';

class CategoriesScreenController extends GetxController {
  final List<CategoryListModel> _categoryList = [];
  final List<ListProductByCategoryModel> _listProductByCategory = [];

  List<CategoryListModel> get categoryList => _categoryList;

  List<ListProductByCategoryModel> get listProductByCategory =>
      _listProductByCategory;

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

  Future<void> fetchAndParseListProductByCategory() async {
    List<Map<String, dynamic>> response =
        await fetchListProductByCategoryRequest();
    _listProductByCategory.clear();
    _listProductByCategory.addAll(
        response.map((json) => ListProductByCategoryModel.fromJson(json)));
  }

  Future initializeMethod() async {
    _isLoading = true;
    update();
    try {
      await Future.wait([
        fetchAndParseListProductByCategory(),
        fetchAndParseCategoryList(),
      ]);
    } catch (e) {
// Handle errors, e.g., show a snack-bar or an error message
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
