import '../../data/model/2 category list model/category_list_model.dart';
import '../../data/utils/export.dart';

class CategoriesScreenController extends GetxController {
  final List<CategoryListModel> _categoryList = [];
  List<CategoryListModel> get categoryList => _categoryList;
  bool _isLoading = true;
  bool get isLoading => _isLoading;
  Future<void> fetchAndParseCategoryList() async {
    List<Map<String, dynamic>> response = await fetchCategoryListRequest();
    _categoryList.clear();
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
    super.onInit();
    initializeMethod();
  }
}
