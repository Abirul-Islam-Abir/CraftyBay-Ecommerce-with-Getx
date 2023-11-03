import '../../../../../../data/utils/export.dart';
import '../../../../widgets/normal_text.dart';
import '../component/categories_product_card.dart';
import '../../../../../state holder controller/list_product_by_category_controller.dart';

class ListProductByCategoriesScreen extends StatelessWidget {
  ListProductByCategoriesScreen({super.key});

  final controller = Get.put(ListProductByCategoriesController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_ios_new_outlined)),
            title: NormalText(controller.product['name'])),
        body: GetBuilder<ListProductByCategoriesController>(
          builder: (controller) => controller.isLoading
              ? const Center(child: CircularProgressIndicator())
              : controller.listProductByCategory.isEmpty
                  ? const Center(
                      child: Text('Empty List'),
                    )
                  : GridView.builder(
                      itemCount: controller.listProductByCategory.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, mainAxisExtent: 120),
                      itemBuilder: (context, index) {
                        final products = controller.listProductByCategory;
                        final categoryName = products[index].category!.categoryName ?? '';
                        final categoryImage =
                            products[index].image ?? ImageAsset.noImageNet;

                        return CategoriesProductCard(
                          onTap: () {
                            Get.toNamed(RouteName.remarkProductDetails,
                                arguments: products[index].id);
                          },
                          img: categoryImage,
                          categoryName: categoryName,
                        );
                      },
                    ),
        ),
      ),
    );
  }
}
