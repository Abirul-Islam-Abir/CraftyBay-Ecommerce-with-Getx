import '../../../../../../data/utils/export.dart';

class CompleteProfileScreenController extends GetxController {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController shippingAddressController =
      TextEditingController();
  final FocusNode firstNameFocus = FocusNode();
  final FocusNode lastNameFocus = FocusNode();
  final FocusNode mobileFocus = FocusNode();
  final FocusNode addressFocus = FocusNode();
  final FocusNode shippingAddressFocus = FocusNode();
  final formKey = GlobalKey<FormState>();
  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  Future fetchAndParseCreateProfileRequest() async {
    try {
      final response = await createProfileRequest({
        "firstName": firstNameController.text,
        "lastName": lastNameController.text,
        "mobile": mobileController.text,
        "city": addressController.text,
        "shippingAddress": shippingAddressController.text
      });
      if (response['msg'] == 'success') {
        SnackToast.loginSuccess();
        storageInstance.write(StorageKey.setCreateProfile, response['msg']);
        Get.offAllNamed(RouteName.bottomNavigationBar);
      } else {
        SnackToast.requestFailed();
      }
    } catch (e) {
      throw Exception('Request failed: $e');
    } finally {
      _isLoading.value = false;
    }
  }

  void validateSubmit() {
    shippingAddressFocus.unfocus();
    if (formKey.currentState!.validate()) {
      _isLoading.value = true;
      fetchAndParseCreateProfileRequest();
    }
  }

  void setTokenData() {
    final tokenData = storageInstance.read(StorageKey.setTokenKey);
    if (tokenData != null) {
      UserData.userToken = tokenData;
    }
  }

  @override
  void onInit() {
    super.onInit();
    setTokenData();
  }
}
