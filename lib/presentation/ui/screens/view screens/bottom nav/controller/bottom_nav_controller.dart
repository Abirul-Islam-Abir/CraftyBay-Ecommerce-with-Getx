import 'package:get/get.dart';

import '../../../../../../data/utils/utils.dart';


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
Future<void> getData()async{
 await Utils.fetchUserData();
}
@override
  void onInit() {
    super.onInit();getData();
  }
}
