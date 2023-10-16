import 'package:crafty_bay_ecommerce/modules/view%20screens/home%20screen/component/products_card.dart';
import 'package:crafty_bay_ecommerce/utils/export.dart';
import 'package:crafty_bay_ecommerce/utils/image_assets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../utils/animation_effect.dart';
import '../controller/remark_product_screen_controller.dart';

class SpecialProductScreen extends StatelessWidget {
  SpecialProductScreen({super.key});
  final controller = Get.put(RemarkProductScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text('Special'),
          ],
        ),
      ),
      body: GridView.builder(
        itemCount: controller.listProductByRemarkSpecial.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisExtent: 250),
        itemBuilder: (context, index) {
          final data = controller.listProductByRemarkSpecial;
          final discount = data[index].discount ?? '';
          final price = data[index].price ?? '';
          final name = data[index].title ?? '';
          final img = data[index].image ?? ImageAsset.noImageNet;
          return Animate(
              effects: EffectFactory.leftToRightAnimate,
              child: ProductCard(
                  onTap: () {
                    Get.toNamed(RouteName.detailsScreen,
                        arguments: data[index].id);
                  },
                  isFavPress: () {},
                  discount: '$discount',
                  price: price,
                  name: name,
                  isFav: true,
                  ratings: 3.5,
                  img: img));
        },
      ),
    );
  }
}
