import 'package:crafty_bay_ecommerce/presentation/network%20connectivity/controller/network_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/screens/view%20screens/read%20profile%20screen/controller/read_profile_controller.dart';

import '../data/utils/export.dart';
import '../presentation/ui/screens/view screens/review screen/controller/review_screen_controller.dart';
import '../presentation/ui/screens/view screens/wish list/controllers/wish_list_controller.dart';

class StateHolderBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavController());
    Get.lazyPut(() => HomeScreenController());
    Get.lazyPut(() => CompleteProfileScreenController());
    Get.lazyPut(() => RemarkProductDetailsScreenController());
    Get.lazyPut(() => SplashScreenController());
    Get.lazyPut(() => EmailVerifyScreenController());
    Get.lazyPut(() => OtpVerifyScreenController());
    Get.lazyPut(() => RemarkProductScreenController());
    Get.lazyPut(() => CategoriesScreenController());
    Get.lazyPut(() => WishListScreenController());
    Get.lazyPut(() => ReadProfileScreenController());
    Get.lazyPut(() => NetworkController());
    Get.lazyPut(() => ReviewScreenController());
  }
}
