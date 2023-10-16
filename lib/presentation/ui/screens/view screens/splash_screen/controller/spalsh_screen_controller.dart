import 'package:get/get.dart';

import '../../../../../../data/routes/app_route_name.dart';
import '../../../../../../data/utils/storage_key.dart';
import '../../../../../../data/utils/store_data_value.dart';

class SplashScreenController extends GetxController {
  Future<void> timerNavigate() async {
    await Future.delayed(const Duration(seconds: 5));
    fetchUserData();
    Get.offNamed(RouteName
        .bottomNavigationBar); /*  final tokenData = storageInstance.read(StorageKey.setTokenKey);
    if (tokenData != null && tokenData.isNotEmpty) {
      Get.offAllNamed(RouteName.homeScreen);
    } else {
      if (isRememberData == true) {
        Get.offAllNamed(RouteName.loginScreen);
      } else {
        Get.offAllNamed(RouteName.onboardingScreen);
      }
    }*/
  }

  void fetchUserData() {
    final tokenData = storageInstance.read(StorageKey.setTokenKey);
    final emailData = storageInstance.read(StorageKey.setEmailKey);
    if (tokenData != null && emailData != null) {
      UserData.userToken = tokenData;
      UserData.userEmail = emailData;
    }
  }
}
