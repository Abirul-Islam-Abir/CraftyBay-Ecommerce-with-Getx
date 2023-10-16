import '../../../../../../data/utils/animation_effect.dart';
import '../../../../../../data/utils/export.dart';
import '../../home screen/component/products_card.dart';

class NewProductScreen extends StatelessWidget {
  NewProductScreen({super.key});

  final controller = Get.put(RemarkProductScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [Text('New')],
        ),
      ),
      body: GridView.builder(
        itemCount: controller.listProductByRemarkNew.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisExtent: 250),
        itemBuilder: (context, index) {
          final data = controller.listProductByRemarkNew;
          final discount = data[index].discount ?? '';
          final price = data[index].price ?? '';
          final name = data[index].title ?? '';
          final img = data[index].image ?? ImageAsset.noImageNet;
          return Animate(
            effects: EffectFactory.leftToRightAnimate,
            child: ProductCard(
              onTap: () {
                Get.toNamed(RouteName.detailsScreen, arguments: data[index].id);
              },
              isFavPress: () {},
              discount: '$discount',
              price: price,
              name: name,
              isFav: false,
              ratings: 3.5,
              img: img,
            ),
          );
        },
      ),
    );
  }
}
