import 'package:get/get.dart';

import '../../../../../../data/model/3 products list/list_product_by_remark_model.dart';
import '../../../../../../data/services/url_services.dart';
import '../../../../../../data/services/3 products list/list_product_by_remark.dart';

class RemarkProductScreenController extends GetxController {
  final List<ListProductByRemarkModel> _listProductByRemarkPopular = [];
  final List<ListProductByRemarkModel> _listProductByRemarkSpecial = [];
  final List<ListProductByRemarkModel> _listProductByRemarkNew = [];
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  List<ListProductByRemarkModel> get listProductByRemarkPopular =>
      _listProductByRemarkPopular;

  List<ListProductByRemarkModel> get listProductByRemarkSpecial =>
      _listProductByRemarkSpecial;

  List<ListProductByRemarkModel> get listProductByRemarkNew =>
      _listProductByRemarkNew;

  // listProductByRemarkNewUrl
  Future<void> fetchAndParseListProductByRemarkPopular() async {
    List<Map<String, dynamic>> response =
        await fetchListProductByRemarkRequest(listProductByRemarkPopularUrl);
    _listProductByRemarkPopular.clear();
    _listProductByRemarkPopular.addAll(
      response.map(
        (json) => ListProductByRemarkModel.fromJson(json),
      ),
    );
  }

  // listProductByRemarkSpecialUrl
  Future<void> fetchAndParseListProductByRemarkSpecial() async {
    List<Map<String, dynamic>> response =
        await fetchListProductByRemarkRequest(listProductByRemarkSpecialUrl);
    _listProductByRemarkSpecial.clear();
    _listProductByRemarkSpecial.addAll(
      response.map(
        (json) => ListProductByRemarkModel.fromJson(json),
      ),
    );
  }

  // listProductByRemarkNewUrl
  Future<void> fetchAndParseListProductByRemarkNew() async {
    List<Map<String, dynamic>> response =
        await fetchListProductByRemarkRequest(listProductByRemarkNewUrl);
    _listProductByRemarkNew.clear();
    _listProductByRemarkNew.addAll(
      response.map(
        (json) => ListProductByRemarkModel.fromJson(json),
      ),
    );
  }

  Future initializeMethod() async {
    _isLoading = true;
    update();
    try {
      await Future.wait([
        fetchAndParseListProductByRemarkPopular(),
        fetchAndParseListProductByRemarkSpecial(),
        fetchAndParseListProductByRemarkNew(),
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

    super.onInit();
    initializeMethod();
  }
}
