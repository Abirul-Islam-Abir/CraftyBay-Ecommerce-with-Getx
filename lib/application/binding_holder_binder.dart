import 'package:crafty_bay_ecommerce/presentation/ui/screens/view%20screens/read%20profile%20screen/controller/read_profile_controller.dart';

import '../data/utils/export.dart';
import '../presentation/ui/screens/view screens/wish list/controllers/wish_list_controller.dart';

class StateHolderBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavController());
    Get.lazyPut(() => HomeScreenController());
    Get.lazyPut(() => CompleteProfileScreenController());
    Get.lazyPut(() => ProductDetailsScreenController());
    Get.lazyPut(() => SplashScreenController());
    Get.lazyPut(() => EmailVerifyScreenController());
    Get.lazyPut(() => OtpVerifyScreenController());
    Get.lazyPut(() => RemarkProductScreenController());
    Get.lazyPut(() => CategoriesScreenController());
    Get.lazyPut(() => WishListScreenController());
    Get.lazyPut(() => ReadProfileScreenController());
  }
}
