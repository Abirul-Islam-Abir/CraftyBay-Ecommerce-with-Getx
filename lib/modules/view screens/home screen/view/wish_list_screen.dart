import '../../../../utils/export.dart';
import '../../../../utils/image_assets.dart';
import '../../../widgets/normal_text.dart';
import '../../bottom nav/controller/bottom_nav_controller.dart';
import '../component/categories_product_card.dart';
import '../controller/home_screen_controller.dart';

class WishListScreen extends StatelessWidget {
  WishListScreen({super.key});

  final controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Get.find<BottomNavController>().goToHome();
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: Get.find<BottomNavController>().goToHome,
                icon: const Icon(Icons.arrow_back_ios_new_outlined)),
            title: const NormalText('Wish List'),
          ),
          body: GetBuilder<HomeScreenController>(
            builder: (_) => GridView.builder(
              itemCount: controller.wishList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, mainAxisExtent: 120),
              itemBuilder: (context, index) {
                final data = controller.wishList;
                final categoryName = data[index].email?.toUpperCase() ?? '';
                final categoryImage =
                    data[index].product ?? ImageAsset.noImageNet;
                return CategoriesProductCard(
                  img: categoryImage,
                  categoryName: categoryName,
                );
              },
            ),
          ),
        ));
  }
}
