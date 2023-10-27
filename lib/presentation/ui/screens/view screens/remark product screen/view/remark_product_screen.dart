import '../../../../../../data/model/3 products list/list_product_by_remark_model.dart';
import '../../../../../../data/utils/animation_effect.dart';
import '../../../../../../data/utils/export.dart';
import '../../home screen/component/products_card.dart';

class RemarkProductScreen extends StatelessWidget {
  RemarkProductScreen(
      {super.key, required this.productName, required this.products});
  final String productName;
  final List<ListProductByRemarkModel> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(productName),
          ],
        ),
      ),
      body: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisExtent: 250),
        itemBuilder: (context, index) {
          final discount = products[index].discount ?? '';
          final price = products[index].price ?? '';
          final name = products[index].title ?? '';
          final img = products[index].image ?? ImageAsset.noImageNet;
          return Animate(
            effects: EffectFactory.leftToRightAnimate,
            child: ProductCard(
                onTap: () {
                  Get.toNamed(RouteName.detailsScreen,
                      arguments: products[index].id);
                },
                isFavPress: () {},
                discount: '$discount',
                price: price,
                name: name,
                isFav: true,
                ratings: 3.5,
                img: img),
          );
        },
      ),
    );
  }
}
