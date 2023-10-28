import '../../../../../../data/model/2 category list model/category_list_model.dart';
import '../../../../../../data/utils/animation_effect.dart';
import '../../../../../../data/utils/export.dart';
import '../../../../widgets/categories_card_shimmer.dart';
import 'categories_product_card.dart';

class AllCategoriesListBuilder extends StatelessWidget {
  AllCategoriesListBuilder(this.products, {super.key});

  final List<CategoryListModel> products;
  final controller = Get.put(CategoriesScreenController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: Get.width,
      padding: const EdgeInsets.all(kTooSmallSize),
      child: GetBuilder<CategoriesScreenController>(
        builder: (controller) => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                controller.isLoading == true ? 4 : products.length,
                (index) => controller.isLoading
                    ? const CategoriesCardShimmer()
                    : Animate(
                        effects: EffectFactory.zoomOut,
                        child: CategoriesProductCard(
                          onTap: () {
                            Get.toNamed(RouteName.listProductByCategoryScreen,
                                arguments: {
                                  'id': '${products[index].id}',
                                  'name': '${products[index].categoryName}'
                                });
                          },
                          img: '${products[index].categoryImg}',
                          categoryName: '${products[index].categoryName}',
                        )),
              ),
            )),
      ),
    );
  }
}
