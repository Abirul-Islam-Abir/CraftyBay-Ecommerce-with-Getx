import 'package:crafty_bay_ecommerce/presentation/ui/screens/view%20screens/home%20screen/component/products_card.dart';

import '../../../../../../data/utils/export.dart';

class ListProductByBrandBuilder extends GetView<HomeScreenController> {
  const ListProductByBrandBuilder(this.products, {super.key});

  final List<ListProductByBrandModel> products;

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
