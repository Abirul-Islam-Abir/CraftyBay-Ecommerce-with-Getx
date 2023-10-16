import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:crafty_bay_ecommerce/modules/view%20screens/bottom%20nav/controller/bottom_nav_controller.dart';
import 'package:crafty_bay_ecommerce/modules/view%20screens/cart%20screen/view/cart_screen.dart';
import 'package:crafty_bay_ecommerce/modules/view%20screens/categories%20screen/view/categories_screen.dart';
import 'package:crafty_bay_ecommerce/modules/view%20screens/home%20screen/view/wish_list_screen.dart';

import '../../../../utils/export.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final controller = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(
      builder: (_) => Scaffold(
        bottomNavigationBar: BottomBarBubble(
          selectedIndex: controller.navIndex,
          items: [
            BottomBarItem(iconData: Icons.home, label: 'Home'),
            BottomBarItem(iconData: Icons.window_sharp, label: 'Category'),
            BottomBarItem(
                iconData: Icons.shopping_cart_checkout_rounded, label: 'Cart'),
            BottomBarItem(iconData: Icons.shopping_bag_outlined, label: 'Wish'),
          ],
          onSelect: (index) {
            controller.navSelectedIndex(index);
          },
        ),
        body: IndexedStack(
          index: controller.navIndex,
          children: [
            HomeScreen(),
            CategoriesScreen(),
            CartScreen(),
            WishListScreen()
          ],
        ),
      ),
    );
  }
}
