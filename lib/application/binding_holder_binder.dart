import 'package:crafty_bay_ecommerce/presentation/network%20connectivity/controller/network_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/screens/view%20screens/read%20profile%20screen/controller/read_profile_controller.dart';

import '../data/utils/export.dart';
import '../presentation/ui/screens/view screens/create product review screen/controller/create_review_controller.dart';
import '../presentation/ui/screens/view screens/review screen/controller/review_screen_controller.dart';
import '../presentation/ui/screens/view screens/wish list/controllers/wish_list_controller.dart';

class StateHolderBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController());
    Get.lazyPut<HomeScreenController>(() => HomeScreenController());
    Get.lazyPut<CompleteProfileScreenController>(() => CompleteProfileScreenController());
    Get.lazyPut<RemarkProductDetailsScreenController>(() => RemarkProductDetailsScreenController());
    Get.lazyPut<SplashScreenController>(() => SplashScreenController());
    Get.lazyPut<EmailVerifyScreenController>(() => EmailVerifyScreenController());
    Get.lazyPut<OtpVerifyScreenController>(() => OtpVerifyScreenController());
    Get.lazyPut<RemarkProductScreenController>(() => RemarkProductScreenController());
    Get.lazyPut<CategoriesScreenController>(() => CategoriesScreenController());
    Get.lazyPut<WishListScreenController>(() => WishListScreenController());
    Get.lazyPut<ReadProfileScreenController>(() => ReadProfileScreenController());
    Get.lazyPut<NetworkController>(() => NetworkController());
    Get.lazyPut<ReviewScreenController>(() => ReviewScreenController());
    Get.lazyPut<CreateReviewController>(() => CreateReviewController());
  }
}
