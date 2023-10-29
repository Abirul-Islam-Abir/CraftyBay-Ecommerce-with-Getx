import '../../../../../../data/utils/animation_effect.dart';
import '../../../../../../data/utils/export.dart';
import '../../../../widgets/normal_text.dart';
import '../../home screen/component/products_card.dart';
import '../controllers/wish_list_controller.dart';

class WishListScreen extends StatelessWidget {
  WishListScreen({super.key});

  final controller = Get.put(WishListScreenController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Get.find<BottomNavController>().goToHome();
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: Get.find<BottomNavController>().goToHome,
                icon: const Icon(Icons.arrow_back_ios_new_outlined)),
            title: const NormalText('Wish List'),
          ),
          body: GetBuilder<HomeScreenController>(
            builder: (controller) =>GridView.builder(
              itemCount: controller.listProductByBrand.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisExtent: 250),
              itemBuilder: (context, index) {
                final products = controller.listProductByBrand;
                final categoryName =
                    products[index].title ?? '';
                final categoryImage =
                    products[index].image ?? ImageAsset.noImageNet;

                final discount = products[index].discount;
                final price = products[index].price;

                return Animate(
                  effects: EffectFactory.leftToRightAnimate,
                  child: ProductCard(
                      onTap: () {
                        Get.toNamed(RouteName.remarkProductDetails,
                            arguments: products[index].id);
                      },
                      isFavPress: () {},
                      discount: '$discount',
                      price: '$price',
                      name: categoryName,
                      isFav: true,
                      ratings: 3.5,
                      img: categoryImage),
                );
              },
            ),
          ),
        ));
  }
}
