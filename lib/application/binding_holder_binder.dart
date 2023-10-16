import '../data/utils/export.dart';

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
  }
}
