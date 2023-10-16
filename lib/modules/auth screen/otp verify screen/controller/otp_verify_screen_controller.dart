import 'dart:async';
import 'package:crafty_bay_ecommerce/utils/snackbar.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../services/user/verify_login.dart';
import '../../../../utils/export.dart';
import '../../../../utils/storage_key.dart';
import '../../../../utils/store_data_value.dart';

class OtpVerifyScreenController extends GetxController {
  final TextEditingController otpController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;
  var countdown = 60.obs; // The initial countdown value
  late Timer _timer;
  RxBool isTimeOut = true.obs;

  Future fetchAndParseUserLogin() async {
    _isLoading.value = true;
    try {
      final response = await verifyLoginRequest(
          email: UserData.userEmail, otp: otpController.text);
      if (response['msg'] == 'success') {
        storageInstance.write(StorageKey.setTokenKey, response['data']);
        _isLoading.value = false;
        Get.offAllNamed(RouteName.completeProfileScreen);
      } else {
        SnackToast.otpVerifyFailed();
      }
    } catch (e) {
      SnackToast.otpVerifyFailed();
      throw Exception('Request failed : $e');
    } finally {
      _isLoading.value = false;
    }
  }

  void onChangeMethod(value) {
    currentText = value;
    update();
  }

  void validateSubmit() {
    if (formKey.currentState!.validate()) {
      if (currentText.length != 4 || currentText == "1234") {
        errorController!.add(ErrorAnimationType.shake);
        hasError = true;
        update();
      } else {
        fetchAndParseUserLogin();
        hasError = false;
        update();
      }
    }
  }

  void startCountdown() {
    countdown.value = 60;
    isTimeOut.value = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown.value > 0) {
        countdown.value--;
        if (countdown.value == 0) {
          isTimeOut.value = true;
        }
      } else {
        isTimeOut.value = false;
        _timer.cancel();
      }
    });
  }

  @override
  void onInit() {
    errorController = StreamController<ErrorAnimationType>();
    super.onInit();
    startCountdown();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  @override
  void onClose() {
    _timer.cancel(); // Cancel the timer when the controller is closed
    super.onClose();
  }
}
