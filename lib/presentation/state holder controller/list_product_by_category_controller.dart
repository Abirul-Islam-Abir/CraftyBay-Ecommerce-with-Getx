import '../../data/model/3 products list/list_product_by_category_model.dart';
import '../../data/services/3 products list/list_product_by_category.dart';
import '../../data/utils/export.dart';

class ListProductByCategoriesController extends GetxController {
  final product = Get.arguments;
  final List<ListProductByCategoryModel> _listProductByCategory = [];
  List<ListProductByCategoryModel> get listProductByCategory =>
      _listProductByCategory;
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> fetchAndParseListProductByCategory() async {
    List<Map<String, dynamic>> response =
        await fetchListProductByCategoryRequest(product['id']);
    _listProductByCategory
        .clear(); // Clear the existing data before adding new data

    _listProductByCategory.addAll(
      response.map(
        (json) => ListProductByCategoryModel.fromJson(json),
      ),
    );
  }

  Future initializeMethod() async {
    _isLoading = true;
    update();
    try {
      await Future.wait([
        fetchAndParseListProductByCategory(),
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
