import 'package:get/get.dart';

import '../../../../../../data/routes/app_route_name.dart';
import '../../../../../../data/utils/storage_key.dart';
import '../../../../../../data/utils/store_data_value.dart';
import '../../../../../../data/utils/utils.dart';

class SplashScreenController extends GetxController {
  Future<void> decitionMaking() async {
    await Utils.fetchUserData();
    await Future.delayed(const Duration(seconds: 5)).then((value) {
      if (UserData.userToken.isEmpty) {
        Get.offNamed(RouteName.emailVerifyScreen);
      } else {
        Get.offNamed(RouteName.bottomNavigationBar);
      }
    });
  }


}
