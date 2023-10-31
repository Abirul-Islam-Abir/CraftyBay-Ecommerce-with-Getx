import '../../../../../../data/services/5 user auth/verify_login.dart';
import '../../../../../../data/utils/export.dart';

class OtpVerifyScreenController extends GetxController {
  final TextEditingController otpController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  var countdown = 60.obs;
  late Timer _timer;
  RxBool isTimeOut = true.obs;
 
  Future fetchAndParseUserLogin() async {
    _isLoading = true;

    final response = await verifyLoginRequest(
        email: UserData.userEmail, otp: otpController.text);
    if (response['msg'] == 'success') {
      storageInstance.write(StorageKey.setTokenKey, response['data']);
      String? profileData = storageInstance.read(StorageKey.setCreateProfile);
      fetchUserData();
      if (profileData != null && profileData.isNotEmpty) {
        _isLoading = false;
        update();
        Get.offAllNamed(RouteName.bottomNavigationBar);
      } else {
        _isLoading = false;
        update();
        Get.offAllNamed(RouteName.completeProfileScreen);
      }
    } else {
      _isLoading = false;
      update();
      SnackToast.otpVerifyFailed();
    }
  }

  void onChangeMethod(value) {
    currentText = value;
    update();
  }
  void fetchUserData() {
    final tokenData = storageInstance.read(StorageKey.setTokenKey);
    final emailData = storageInstance.read(StorageKey.setEmailKey);
    if (tokenData != null && emailData != null) {
      UserData.userToken = tokenData;
      UserData.userEmail = emailData;
    }
  }
  void validateSubmit() {
    if (formKey.currentState!.validate()) {
      if (currentText.length != 6 || currentText == "123456") {
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
    countdown.value = 30;
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
