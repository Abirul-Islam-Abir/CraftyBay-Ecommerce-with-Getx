import '../../../../../../data/utils/animation_effect.dart';
import '../../../../../../data/utils/export.dart';
import '../../../../widgets/bottom_details_card.dart';
import '../../../../widgets/common_text.dart';
import '../../../../widgets/normal_text.dart';
import '../../../../widgets/product_details_screen_shimmer.dart';
import '../components/color_circle_builder.dart';
import '../components/image_card.dart';
import '../components/product_details_title_card.dart';
import '../components/size_circle_builder.dart';

class ProductsDetailsScreen extends StatelessWidget {
  ProductsDetailsScreen({Key? key}) : super(key: key);
  final controller = Get.put(ProductDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: const Text('Product Details')),
      body: GetBuilder<ProductDetailsScreenController>(
        builder: (_) {
          final data = controller.productDetailsById;
          return controller.isLoading
              ? const ProductsDetailsShimmer()
              : Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: AnimateList(
                          delay: const Duration(seconds: 1),
                          effects: EffectFactory.upToDownAnimate,
                          children: [
                            ImageCard(productDetails: data),
                            const SizedBox(height: 10),
                            ProductDetailsTitleCard(
                              count: controller.countProduct.toString(),
                              title:
                                  '${data[0].product?.title ?? " "} ${data[0].product?.brandId ?? "null"}',
                              ratings: '${data[0].product?.star ?? " "}',
                              save: '${data[0].product?.discount ?? " "}',
                              addOnTap: controller.increment,
                              isFavPress: () {},
                              removeOnTap: controller.decrement,
                            ),
                            const SizedBox(height: 10),
                            ColorCircleBuilder(controller.color),
                            SizeCircleBuilder(controller.list),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: kTooSmallSize),
                              child: NormalText('Description'),
                            ),
                            CommonText(data[0].des ?? " "),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                    BottomDetailsCard(
                      name: 'Add to cart',
                      onPressed: controller.fetchAndParseCreateCartList,
                      price: data[0].product?.price ?? " ",
                    ),
                  ],
                );
        },
      ),
    );
  }
}
