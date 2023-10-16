import 'package:crafty_bay_ecommerce/model/products%20model/list_product_by_remark_model.dart';
import 'package:crafty_bay_ecommerce/modules/view%20screens/home%20screen/component/products_card.dart';
import 'package:crafty_bay_ecommerce/modules/view%20screens/remark%20product%20screen/controller/remark_product_screen_controller.dart';
import 'package:crafty_bay_ecommerce/modules/widgets/product_card_shimmer.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../utils/animation_effect.dart';
import '../../../../utils/export.dart';
import '../controller/home_screen_controller.dart';

class ListProductByRemarkBuilder extends GetView<HomeScreenController> {
  const ListProductByRemarkBuilder(this.products, {super.key});

  final List<ListProductByRemarkModel> products;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: GetBuilder<RemarkProductScreenController>(
        builder: (controller) {
          final product = products.length;
          final length = product >= 5 ? 5 : product;
          return Row(
            children: List.generate(
              controller.isLoading ? 4 : length,
              (index) => controller.isLoading
                  ? const ProductCardShimmer()
                  : Animate(
                      effects: EffectFactory.leftToRightAnimate,
                      child: ProductCard(
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
          );
        },
      ),
    );
  }
}
