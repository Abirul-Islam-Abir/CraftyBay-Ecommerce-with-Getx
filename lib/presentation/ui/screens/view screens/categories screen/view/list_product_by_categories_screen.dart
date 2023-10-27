import '../../../../../../data/utils/export.dart';
import '../../../../widgets/normal_text.dart';
import '../component/categories_product_card.dart';
import '../controller/list_product_by_category_controller.dart';

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
                title: const NormalText('Category')),
            body: GetBuilder<ListProductByCategoriesController>(
                builder: (controller) => controller.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : controller.listProductByCategory.isEmpty
                        ? Center(
                            child: Text('Empty List'),
                          )
                        : GridView.builder(
                            itemCount: controller.listProductByCategory.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4, mainAxisExtent: 120),
                            itemBuilder: (context, index) {
                              final data = controller.listProductByCategory;
                              final categoryName =
                                  data[index].category!.categoryName ?? '';
                              final categoryImage =
                                  data[index].category!.categoryImg ??
                                      ImageAsset.noImageNet;
                              return CategoriesProductCard(
                                onTap: () {},
                                img: categoryImage,
                                categoryName: categoryName,
                              );
                            }))));
  }
}
