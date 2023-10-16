import 'package:crafty_bay_ecommerce/modules/view%20screens/bottom%20nav/controller/bottom_nav_controller.dart';
import 'package:crafty_bay_ecommerce/modules/view%20screens/categories%20screen/controller/categories_screen_controller.dart';
import 'package:crafty_bay_ecommerce/modules/view%20screens/home%20screen/component/categories_product_card.dart';
import 'package:crafty_bay_ecommerce/modules/view%20screens/home%20screen/controller/home_screen_controller.dart';
import 'package:crafty_bay_ecommerce/utils/image_assets.dart';

import '../../../../utils/export.dart';
import '../../../widgets/normal_text.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final controller = Get.put(CategoriesScreenController());

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
                onPressed: () {
                  Get.find<BottomNavController>().goToHome();
                },
                icon: const Icon(Icons.arrow_back_ios_new_outlined)),
            title: const NormalText('Category'),
          ),
          body: GetBuilder<HomeScreenController>(
            builder: (_) => GridView.builder(
              itemCount: controller.listProductByCategory.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, mainAxisExtent: 120),
              itemBuilder: (context, index) {
                final data = controller.listProductByCategory;
                final categoryName =
                    data[index].category?.categoryName?.toUpperCase() ??
                        'Name : Null';
                final categoryImage =
                    data[index].category?.categoryImg ?? ImageAsset.noImageNet;
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
