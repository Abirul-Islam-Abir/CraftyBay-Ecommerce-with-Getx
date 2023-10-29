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
          body: GetBuilder<WishListScreenController>(
            builder: (controller) =>GridView.builder(
              itemCount: controller.wishList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisExtent: 220),
              itemBuilder: (context, index) {
                final products = controller.wishList;
                final categoryName =
                    products[index].product!.title ?? '';
                final categoryImage =
                    products[index].product!.image ?? ImageAsset.noImageNet;

                final discount = products[index].product!.discount;
                final price = products[index].product!.price;

                return ProductCard(
                    onTap: () {
                      Get.toNamed(RouteName.remarkProductDetails,
                          arguments: products[index].productId);
                    },
                    isFavPress: () {},
                    discount: '$discount',
                    price: '$price',
                    name: categoryName,
                    isFav: true,
                    ratings: 3.5,
                    img: categoryImage);
              },
            ),
          ),
        ));
  }
}
