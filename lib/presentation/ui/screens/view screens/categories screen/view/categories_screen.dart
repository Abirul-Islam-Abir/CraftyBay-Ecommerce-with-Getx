import '../../../../../../data/utils/export.dart';
import '../../../../widgets/normal_text.dart';
import '../component/categories_product_card.dart';

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
          body: GetBuilder<CategoriesScreenController>(
            builder: (_) => controller.categoryList.isEmpty
                ?   Center(child: Text(AppString.emptyList))
                : GridView.builder(
                    itemCount: controller.categoryList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4, mainAxisExtent: 120),
                    itemBuilder: (context, index) {
                      final products = controller.categoryList;
                      final categoryName = products[index].categoryName ?? '';
                      final categoryImage =
                          products[index].categoryImg ?? ImageAsset.noImageNet;

                      return CategoriesProductCard(
                        onTap: () {
                          Get.toNamed(RouteName.listProductByCategoryScreen,
                              arguments: {
                                'id': '${products[index].id}',
                                'name': '${products[index].categoryName}'
                              });
                        },
                        img: categoryImage,
                        categoryName: categoryName,
                      );
                    },
                  ),
          ),
        ));
  }
}
