import 'package:crafty_bay_ecommerce/utils/export.dart';
import 'package:crafty_bay_ecommerce/utils/snackbar.dart';
import 'package:crafty_bay_ecommerce/utils/storage_key.dart';
import 'package:crafty_bay_ecommerce/utils/store_data_value.dart';
import '../../../../services/user/user_login.dart';

class EmailVerifyScreenController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  Future fetchAndParseUserLogin() async {
    try {
      final response = await userLoginRequest(emailController.text.trim());
      if (response['msg'] == 'success') {
        _isLoading.value = false;
        storageInstance.write(StorageKey.setEmailKey, emailController.text);
        UserData.userEmail = emailController.text;
        Get.toNamed(RouteName.otpVerifyScreen);
      } else {
        SnackToast.loginFailed();
      }
    } catch (e) {
      SnackToast.loginFailed();
      throw Exception('Request failed :$e');
    } finally {
      _isLoading.value = false;
    }
  }

  void validateSubmit() {
    focusNode.unfocus();
    if (formKey.currentState!.validate()) {
      _isLoading.value = true;
      fetchAndParseUserLogin();
    }
  }

  void getUserEmail() {
    final emailData = storageInstance.read(StorageKey.setEmailKey);
    if (emailData != null) {
      UserData.userEmail = emailData;
      emailController.text = emailData;
    }
  }

  @override
  void onInit() {
    getUserEmail();
    super.onInit();
  }
}
