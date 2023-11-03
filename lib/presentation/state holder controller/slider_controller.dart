import 'package:get/get.dart';

import '../../data/model/4 slider list/list_product_slider_model.dart';
import '../../data/services/4 slider list/list_porduct_slider.dart';
import '../../data/utils/store_data_value.dart';

class SliderImageController extends GetxController {
  final List<ListProductSliderModel> _listProductSlider = [];

  List<ListProductSliderModel> get listProductSlider => _listProductSlider;
  bool _isLoading = true;

  bool get isLoading => _isLoading;
  int carouselCurrentIndex = 0;

  void carouselSelectedIndex(index) {
    carouselCurrentIndex = index;
    update();
  }

  Future<void> fetchAndParseListProductSlider() async {
    List<Map<String, dynamic>> response = await fetchListProductSliderRequest();
    _listProductSlider.clear();
    _listProductSlider
        .addAll(response.map((json) => ListProductSliderModel.fromJson(json)));
  }

  Future<void> initializeMethod() async {
    _isLoading = true;
    update();
    try {
      if (UserData.userToken.isNotEmpty) {
        await Future.wait([
          fetchAndParseListProductSlider(),
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

    super.onInit();
    initializeMethod();
  }
}
