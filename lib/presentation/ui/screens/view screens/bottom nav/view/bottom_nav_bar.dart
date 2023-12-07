import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';

import '../../../../../../data/utils/export.dart';
import '../../cart screen/view/cart_screen.dart';
import '../../categories screen/view/categories_screen.dart';
import '../../wish list/view/wish_list_screen.dart';

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
            BottomBarItem(iconData: Icons.home, label:AppString.home),
            BottomBarItem(iconData: Icons.window_sharp, label: AppString.category ),
            BottomBarItem(
                iconData: Icons.shopping_cart_checkout_rounded, label:AppString.cart),
            BottomBarItem(iconData: Icons.shopping_bag_outlined, label: AppString.wish),
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
