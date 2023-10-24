import 'package:crafty_bay_ecommerce/presentation/ui/screens/view%20screens/home%20screen/component/products_card.dart';

import '../../../../../../data/model/3 products list/list_product_by_remark_model.dart';
import '../../../../../../data/utils/export.dart';
import '../../../../widgets/product_card_shimmer.dart';

class ListProductByRemarkBuilder extends GetView<HomeScreenController> {
  const ListProductByRemarkBuilder(this.products, {super.key});

  final List<ListProductByRemarkModel> products;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RemarkProductScreenController>(
      builder: (controller) {
        final product = products.length;
        final length = product >= 5 ? 5 : product;
        return SizedBox(
          height: 200,
          width: Get.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                controller.isLoading ? 4 : length,
                (index) => controller.isLoading
                    ? const ProductCardShimmer()
                    : ProductCard(
                        onTap: () {
                          Get.toNamed(RouteName.detailsScreen,
                              arguments: products[index].id);
                        },
                        isFavPress: () {},
                        discount: '${products[index].discount}',
                        price: '${products[index].price}',
                        name: '${products[index].title}',
                        isFav: true,
                        ratings: 3.5,
                        img: '${products[index].image}'),
              ),
            ),
          ),
        );
      },
    );
  }
}
