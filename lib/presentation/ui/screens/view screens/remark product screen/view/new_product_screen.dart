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
          final data = controller.listProductByRemarkNew[index];
          final discount = data.discount ?? '';
          final price = data.price ?? '';
          final name = data.title ?? '';
          final img = data.image ?? ImageAsset.noImageNet;
          return Animate(
            effects: EffectFactory.leftToRightAnimate,
            child: ProductCard(
              onTap: () {
                Get.toNamed(RouteName.detailsScreen, arguments: data.id);
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
