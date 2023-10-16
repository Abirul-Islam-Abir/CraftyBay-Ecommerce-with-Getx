import 'package:crafty_bay_ecommerce/modules/view%20screens/bottom%20nav/controller/bottom_nav_controller.dart';
import 'package:crafty_bay_ecommerce/modules/view%20screens/home%20screen/controller/home_screen_controller.dart';
import 'package:crafty_bay_ecommerce/modules/view%20screens/remark%20product%20screen/controller/remark_product_screen_controller.dart';
import 'package:get/get.dart';
import '../../modules/auth screen/complete profile screen/controller/complete_profile_screen_controller.dart';
import '../../modules/auth screen/email verify screen/controller/email_verify_screen_controller.dart';
import '../../modules/auth screen/otp verify screen/controller/otp_verify_screen_controller.dart';
import '../../modules/view screens/splash_screen/controller/spalsh_screen_controller.dart';
import '../modules/view screens/categories screen/controller/categories_screen_controller.dart';
import '../modules/view screens/details screen/controller/produts_details_screen_controller.dart';

class BindingHolder extends Bindings {
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
  }
}
