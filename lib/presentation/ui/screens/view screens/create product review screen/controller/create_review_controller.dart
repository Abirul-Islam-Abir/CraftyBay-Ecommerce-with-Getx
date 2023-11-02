

import 'package:crafty_bay_ecommerce/data/services/7%20review%20list/create_product_review.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/screens/view%20screens/review%20screen/controller/review_screen_controller.dart';


import '../../../../../../data/utils/export.dart';

class CreateReviewController extends GetxController {
  bool  _isLoading = false;
  bool get isLoading => _isLoading ;
  final product = Get.arguments;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController reviewController = TextEditingController();
  final FocusNode firstNameFocus = FocusNode();
  final FocusNode lastNameFocus = FocusNode();
  final FocusNode reviewFocus = FocusNode();
  Future  postCreateProductReviewRequest ()async{
    final Map<String, String> data = {
      "description": reviewController.text.trim(),
      "product_id": product['productId'].toString(),
      "rating": product['rating'].toString(),
    };
    final response = await postCreateProductByReviewRequest(data);
    if (response['msg'] == 'success') {
      _isLoading = false;
      update();
      Get.back();
      SnackToast.requestSuccess();
      await Get.find<ReviewScreenController>().handleDataCalling();
    } else {
      SnackToast.requestFailed();
    }
  }

  final formKey = GlobalKey<FormState>();

  void validateSubmit() {
    reviewFocus.unfocus();
    if (formKey.currentState!.validate()) {
      _isLoading = true;
      update();
      postCreateProductReviewRequest();
    }
  }
}