import 'package:crafty_bay_ecommerce/model/products%20model/list_product_by_category_model.dart';
import 'package:crafty_bay_ecommerce/modules/view%20screens/home%20screen/component/products_card.dart';
import 'package:crafty_bay_ecommerce/modules/view%20screens/home%20screen/controller/home_screen_controller.dart';

import '../../../../utils/export.dart';

class ListProductByCategoryBuilder extends GetView<HomeScreenController> {
  const ListProductByCategoryBuilder(this.products, {super.key});

  final List<ListProductByCategoryModel> products;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: GetBuilder<HomeScreenController>(
            builder: (controller) => Row(
                children: List.generate(
                    products.length,
                    (index) => ProductCard(
                        onTap: () {},
                        isFavPress: () {},
                        discount: '${products[index].discount}',
                        price: '${products[index].price}',
                        name: '${products[index].title}',
                        isFav: true,
                        ratings: 3.5,
                        img: '${products[index].image}')))));
  }
}
