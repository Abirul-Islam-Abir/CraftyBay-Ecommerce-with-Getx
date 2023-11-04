import 'package:crafty_bay_ecommerce/presentation/state%20holder%20controller/network_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/state%20holder%20controller/create_invoice_controller.dart';
import 'package:crafty_bay_ecommerce/presentation/state%20holder%20controller/read_profile_controller.dart';

import '../data/utils/export.dart';
import '../presentation/state holder controller/create_review_controller.dart';
import '../presentation/state holder controller/review_screen_controller.dart';
import '../presentation/state holder controller/theme_controller.dart';
import '../presentation/state holder controller/wish_list_controller.dart';

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
    Get.lazyPut<CreateInvoiceController>(() => CreateInvoiceController());
    Get.lazyPut<ThemeController>(() => ThemeController());
  }
}
