import 'package:get/get.dart';

class BottomNavController extends GetxController {
  int navIndex = 0;
  void navSelectedIndex(index) {
    navIndex = index;
    update();
  }

  void goToHome() {
    navIndex = 0;
    update();
  }

  void goToCategoryScreen() {
    navIndex = 1;
    update();
  }
}