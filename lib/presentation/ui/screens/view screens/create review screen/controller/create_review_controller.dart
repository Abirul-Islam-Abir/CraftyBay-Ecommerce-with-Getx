import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../../../../../data/utils/export.dart';

class
CreateReviewController extends GetxController {

  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
   final TextEditingController reviewController = TextEditingController();
  final FocusNode firstNameFocus = FocusNode();
  final FocusNode lastNameFocus = FocusNode();
  final FocusNode reviewFocus = FocusNode();
  final formKey = GlobalKey<FormState>();
  void validateSubmit() {
    reviewFocus.unfocus();
    if (formKey.currentState!.validate()) {
      _isLoading.value = true;
     // fetchAndParseCreateProfileRequest();
    }
  }
}